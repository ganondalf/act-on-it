
namespace :app do

  desc 'Populate app with only basic charity info'
  task load_charity_ids: :environment do

    base_url = "http://api.charitynavigator.org/api/v1/organizations-bulk/?app_key=#{ENV['CN_APP_KEY']}&app_id=#{ENV['CN_APP_ID']}&limit=0&format=json"

    charities =  HTTParty.get( base_url )
    charities.shift

    charities['objects'].each do |charity|
      boolean = charity['donoradvisory'] === 'True' ? true : false
      charity = Charity.find_or_create_by!( 
        cn_donor_advisory: boolean,
        ein: charity['ein'],
        cn_id: charity['orgid'],
        cn_overall_rating: charity['overall_rating'],
        cn_overall_score: charity['overall_score']
      )

      puts charity.eid
    end

  end

  desc 'Populate detailed charity information'
  task load_charity_detail: :environment do

    base_url = "http://api.charitynavigator.org/api/v1/organizations/?app_key=#{ENV['CN_APP_KEY']}&app_id=#{ENV['CN_APP_ID']}"

    Charity.all.each do |charity|
      if charity.cn_data.nil?
        charity_detail = HTTParty.get("#{base_url}&orgid=#{charity.cn_id}&format=json")
        unless charity_detail.nil?
          charity_detail.shift
          charity.update( cn_data: charity_detail['objects'].first ) 
          puts charity.id
        end
      end

    end
    
  end

  desc 'Populate causes'
  task load_causes: :environment do

    base_url = "http://api.charitynavigator.org/api/v1/causes/?app_key=#{ENV['CN_APP_KEY']}&app_id=#{ENV['CN_APP_ID']}&format=json&limit=100"

    all_causes = HTTParty.get("#{base_url}")
    all_causes.shift
    all_causes['objects'].each do |cause|
      category_id = cause['categoryid'].split('/').last.to_i
      new_cause = Cause.find_or_create_by!(
        name: cause['cause'],
        cn_category: cause['category'],
        cn_category_id: category_id,
        cn_description: cause['description'],
        cn_id: cause['causeid'].to_i
      )
      puts new_cause.id
    end

  end

  desc 'Associate causes to categories'
  task causes_categories: :environment do

    Cause.all.each do |cause|
      category_id = cause.cn_category_id
      categories = Category.where( cn_category_id: category_id )
      categories.each do |category|
        category.causes << cause
        puts "#{category.name} associated to #{ cause.name }"
      end
    end

  end

  desc 'Parse category descriptions'
  task cause_descriptions: :environment do

    base_url = "http://access.alchemyapi.com/calls/text/TextGetRankedConcepts"

    Cause.all.each do |cause|

      #Add the API key and set the output mode to JSON
      options = {}
      options['apikey'] = ENV['ALCHEMY_API_KEY']
      options['outputMode'] = 'json'
      options['maxRetrieve'] = '20'
      options['text'] = cause.cn_description

      uri = URI.parse(base_url)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data( options)

      # disable gzip encoding which blows up in Zlib due to Ruby 2.0 bug
      # otherwise you'll get Zlib::BufError: buffer error
      request['Accept-Encoding'] = 'identity'

      #Fire off the HTTP request
      res = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(request)
      end

      response = JSON.parse( res.body )

      if response['status'].downcase == 'ok' && response['concepts'].present?

        response['concepts'].each do |concept|
          new_cause_name = concept['text'].downcase
          categories = cause.categories

          categories.each do |category|
            new_cause = Cause.find_or_create_by( name: new_cause_name )
            binding.pry
            category.causes << new_cause
            puts "#{category.name} associated to #{ new_cause.name }"
          end
        end

      else 
        puts 'no response from alchemy'
      end
      

    end

  end

end
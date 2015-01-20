class Keyword < ActiveRecord::Base

  # all keywords are stored in the keyword table
  self.table_name = 'keywords'

  #----------------------------------------------------------------------
  # associations

  has_and_belongs_to_many :organizations

  #----------------------------------------------------------------------
  # validations
  
  before_validation   :normalize_name, 
                      on: :create,
                      if: 'name.present?'

  before_validation   :assign_stem, 
                      on: :create,
                      if: 'name.present? && stem.blank?' 

  validates           :name,   
                      uniqueness: true,
                      presence: true,
                      format: /\A[a-z0-9][0-9a-z\s]*[a-z0-9]\z/ 

  protected; def normalize_name
    self.name = 
      self.name.
        gsub( /[^A-Z0-9]/i, ' ' ).
        squish.
        downcase
    end

  protected; def assign_stem
    self.stem = (self.name).stem.to_sym 
  end

end


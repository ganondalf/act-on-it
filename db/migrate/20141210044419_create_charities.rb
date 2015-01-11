class CreateCharities < ActiveRecord::Migration
  def up
    create_table :charities do |t|
      t.references  :causes, index: true
      t.string      :name
      t.integer     :ein
      t.integer     :cn_overall_rating
      t.integer     :cn_overall_score
      t.boolean     :cn_donor_advisory
      t.integer     :cn_id
    end
  end

  def down
    drop_table :charities
  end
end

class Charitieskeywords < ActiveRecord::Migration
  def change
    create_table :charities_keywords, id: false do |t|
      t.integer :charity_id
      t.integer :keyword_id
    end
 
    add_index :charities_keywords, :charity_id
    add_index :charities_keywords, :keyword_id
  end
end

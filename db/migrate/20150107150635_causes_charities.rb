class CausesCharities < ActiveRecord::Migration
  def change
    create_table :causes_charities, id: false do |t|
      t.integer :cause_id
      t.integer :charity_id
    end
 
    add_index :causes_charities, :cause_id
    add_index :causes_charities, :charity_id

    remove_index :charities, column: :causes_id
    remove_index :causes, column: :charities_id
  
    remove_column :charities, :causes_id, :integer
    remove_column :causes, :charities_id, :integer
  end
end

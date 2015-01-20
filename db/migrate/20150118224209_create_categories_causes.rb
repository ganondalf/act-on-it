class CreateCategoriesCauses < ActiveRecord::Migration
  def change
    create_table :categories_causes, id: false do |t|
      t.belongs_to :category
      t.belongs_to :cause
    end

    add_index :categories_causes, [ :category_id, :cause_id ], :unique => true, :name => 'by_category_and_cause'
    add_index :categories_causes, [ :cause_id, :category_id ], :unique => true, :name => 'by_cause_and_category'
  end
end

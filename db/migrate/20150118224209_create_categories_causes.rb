class CreateCategoriesCauses < ActiveRecord::Migration
  def change
    create_table :categories_causes, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :cause, index: true
    end
  end
end

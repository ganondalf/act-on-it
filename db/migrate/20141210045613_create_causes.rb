class CreateCauses < ActiveRecord::Migration
  def up
    create_table :causes do |t|
      t.references :charities, index: true
      t.string :name
      t.string :cn_category
      t.integer :cn_category_id
      t.integer :cn_id
    end
  end

  def down
    drop_table :causes
  end
end

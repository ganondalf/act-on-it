class Createkeywords < ActiveRecord::Migration
  def up
    create_table :keywords do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :keywords
  end
end

class AddStemToKeywords < ActiveRecord::Migration
  def up
    add_column :keywords, :stem, :string
  end

  def down
    remove_column :causes, :stem, :string
  end
end

class AddDescriptionToCause < ActiveRecord::Migration
  def up
    add_column :causes, :cn_description, :text
  end

  def down
    remove_column :causes, :cn_description, :text
  end
end

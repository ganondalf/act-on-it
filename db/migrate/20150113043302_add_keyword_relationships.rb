class AddKeywordRelationships < ActiveRecord::Migration
  def change
    add_column :keywords, :parent_id, :integer
    add_column :keywords, :child_id, :integer
  end
end

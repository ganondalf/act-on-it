class RenameCharityCauses < ActiveRecord::Migration
  def change
    drop_table :keywords
    rename_table :charities, :organizations
    rename_table :causes, :keywords
  end
end
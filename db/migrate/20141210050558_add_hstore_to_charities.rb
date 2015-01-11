class AddHstoreToCharities < ActiveRecord::Migration
  def up
    add_column :charities, :cn_data, :hstore
  end

  def down
    remove_column :charities, :cn_data, :hstore
  end
end

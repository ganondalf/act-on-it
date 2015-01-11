class DropCausesCharities < ActiveRecord::Migration
  def change
    drop_table :causes_charities
  end
end

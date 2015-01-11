class RemoveAnalytics < ActiveRecord::Migration
  def change
    drop_table :analytics_samples
  end
end

class AddTypeToStis < ActiveRecord::Migration
  def change
    add_column :organizations, :type, :string
    add_column :keywords, :type, :string

    drop_table :charities_keywords
    create_table :keywords_organizations, id: false do |t|
      t.integer :organization_id
      t.integer :keyword_id
    end
  end
end

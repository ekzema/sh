class AddThreecatSeoToThreecategories < ActiveRecord::Migration[5.0]
  def change
    add_column :threecategories, :description, :text
    add_column :threecategories, :meta_desc, :string
    add_column :threecategories, :meta_key, :string
    add_column :threecategories, :meta_title, :string
  end
end

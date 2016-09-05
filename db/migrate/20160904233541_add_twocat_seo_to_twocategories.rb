class AddTwocatSeoToTwocategories < ActiveRecord::Migration[5.0]
  def change
    add_column :twocategories, :description, :text
    add_column :twocategories, :meta_desc, :string
    add_column :twocategories, :meta_key, :string
    add_column :twocategories, :meta_title, :string
  end
end

class AddCaregorySeoToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :meta_desc, :string
    add_column :categories, :meta_key, :string
    add_column :categories, :meta_title, :string
  end
end

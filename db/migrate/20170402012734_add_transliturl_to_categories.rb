class AddTransliturlToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :translit_url, :string
  end
end

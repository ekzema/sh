class AddTransliturlToTwocategories < ActiveRecord::Migration[5.0]
  def change
    add_column :twocategories, :translit_url, :string
  end
end

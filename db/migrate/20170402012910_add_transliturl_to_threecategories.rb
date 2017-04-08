class AddTransliturlToThreecategories < ActiveRecord::Migration[5.0]
  def change
    add_column :threecategories, :translit_url, :string
  end
end

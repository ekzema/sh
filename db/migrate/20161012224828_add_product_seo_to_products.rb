class AddProductSeoToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :meta_desc, :string
    add_column :products, :meta_key, :string
    add_column :products, :meta_title, :string
  end
end

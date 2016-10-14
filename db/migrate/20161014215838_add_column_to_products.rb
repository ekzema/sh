class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :name, :string
    add_column :products, :article, :string
    add_column :products, :moderation, :integer
    add_column :products, :visible, :integer
  end
end

class CreateFavoriteProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_products do |t|
      t.references :products, foreign_key: true, :null => false
      t.references :sellers, foreign_key: true, :null => false

      t.timestamps
    end
  end
end

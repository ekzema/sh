class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :product, foreign_key: true, :null => false
      t.references :seller, foreign_key: true, :null => false

      t.timestamps
    end
  end
end

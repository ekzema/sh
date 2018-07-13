class CreateSellersCrossDialogs < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers_cross_dialogs do |t|
      t.references :dialog, foreign_key: true, :null => false
      t.references :seller, foreign_key: true, :null => false
      t.references :product, foreign_key: true, :null => false

      t.timestamps
    end
  end
end

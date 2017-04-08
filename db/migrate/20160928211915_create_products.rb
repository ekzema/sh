class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :size
      t.integer :price
      t.text :quality
      t.integer :category_id
      t.integer :twocategory_id
      t.integer :threecategory_id

      t.timestamps
    end
  end
end

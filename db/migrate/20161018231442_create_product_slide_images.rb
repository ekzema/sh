class CreateProductSlideImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_slide_images do |t|
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end

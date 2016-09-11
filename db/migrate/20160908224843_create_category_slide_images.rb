class CreateCategorySlideImages < ActiveRecord::Migration[5.0]
  def change
    create_table :category_slide_images do |t|
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

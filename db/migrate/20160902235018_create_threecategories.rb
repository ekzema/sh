class CreateThreecategories < ActiveRecord::Migration[5.0]
  def change
    create_table :threecategories do |t|
      t.string :name
      t.references :twocategory, foreign_key: true

      t.timestamps
    end
  end
end

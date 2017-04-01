class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.integer :moderation, default: 0

      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :dialog, foreign_key: true, :null => false
      t.references :seller, foreign_key: true, :null => false
      t.references :recipient, foreign_key: { to_table: :sellers }, :null => false

      t.datetime :status
      t.timestamps
    end
  end
end

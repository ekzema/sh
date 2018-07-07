class CreateUsersCrossChats < ActiveRecord::Migration[5.0]
  def change
    create_table :users_cross_chats do |t|
      t.references :dialog, foreign_key: true, :null => false
      t.references :seller, foreign_key: true, :null => false

      t.timestamps
    end
  end
end

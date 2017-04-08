class AddResetSessionToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :reset_session, :integer, default: 1
  end
end

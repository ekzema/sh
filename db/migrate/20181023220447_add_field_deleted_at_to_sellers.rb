class AddFieldDeletedAtToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :deleted_at, :datetime
  end
end

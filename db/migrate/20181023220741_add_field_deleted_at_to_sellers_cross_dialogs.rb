class AddFieldDeletedAtToSellersCrossDialogs < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers_cross_dialogs, :deleted_at, :datetime
  end
end

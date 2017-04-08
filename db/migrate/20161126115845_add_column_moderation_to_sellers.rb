class AddColumnModerationToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :moderation, :integer, default: 0
  end
end

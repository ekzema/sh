class AddColumnModerationToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :moderation, :integer
  end
end

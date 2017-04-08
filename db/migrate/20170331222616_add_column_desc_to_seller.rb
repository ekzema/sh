class AddColumnDescToSeller < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :description, :text
  end
end

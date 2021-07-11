class AddPermissionFieldsToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :permissions, :integer, limit: 4, null: false, default: 0
    add_column :lists, :anon_permissions, :integer, limit: 4, null: false, default: 0
  end
end

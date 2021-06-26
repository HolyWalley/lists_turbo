class CreateListsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :lists_items do |t|
      t.references :list, null: false, type: :uuid
      t.string :value, null: false
      t.boolean :checked, default: false
      t.references :last_checked_by, null: true

      t.timestamps
    end
  end
end

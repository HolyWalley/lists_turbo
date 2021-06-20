class CreateListsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :lists_items do |t|
      t.references :list, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end

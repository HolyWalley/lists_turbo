class CreateListItemVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :list_item_votes do |t|
      t.references :list_item
      t.references :voted_by

      t.string :sign, index: true, null: false

      t.timestamps
    end
  end
end

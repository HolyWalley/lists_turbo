class CreateListInvitations < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'citext'

    create_table :list_invitations do |t|
      t.references :list, type: :uuid
      t.string :name
      t.citext :email, null: false
      t.boolean :accepted, default: false, null: false

      t.timestamps
    end

    add_index :list_invitations, %i[list_id email], unique: true
  end
end

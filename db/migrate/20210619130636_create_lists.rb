# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'

    create_table :lists, id: :uuid do |t|
      t.references :user, null: false
      t.string :name

      t.jsonb :configuration, null: false, default: {}

      t.timestamps
    end
  end
end

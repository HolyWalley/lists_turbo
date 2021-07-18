# frozen_string_literal: true

class List::Item < ApplicationRecord
  # Associations
  belongs_to :list
  belongs_to :last_checked_by, optional: true

  has_many :votes, foreign_key: :list_item_id, dependent: :destroy

  # Validations
  validates :value, presence: true
end

# frozen_string_literal: true

class Lists::Item < ApplicationRecord
  # Associations
  belongs_to :list, class_name: "::List"
  belongs_to :last_checked_by, class_name: "::Users::User", optional: true

  has_many :votes, class_name: "::Lists::Items::Vote", foreign_key: :list_item_id, dependent: :destroy

  # Validations
  validates :value, presence: true
end

# frozen_string_literal: true

class Lists::Items::Vote < ApplicationRecord
  # Associations

  belongs_to :list_item, class_name: "Lists::Item", inverse_of: :votes
  belongs_to :voted_by, class_name: "User"

  # Validations

  validates :sign, presence: true
end

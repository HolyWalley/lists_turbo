# frozen_string_literal: true

class List::Item::Vote < ApplicationRecord
  # Associations

  belongs_to :list_item, class_name: "::List::Item", inverse_of: :votes
  belongs_to :voted_by, class_name: "User"

  # Validations

  validates :sign, presence: true
end

# frozen_string_literal: true

class Lists::Item < ApplicationRecord
  # Associations
  belongs_to :list, class_name: 'Lists::List'
  belongs_to :last_checked_by, class_name: "Users::User", optional: true

  # Validations7
  validates :value, presence: true
end

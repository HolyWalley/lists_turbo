# frozen_string_literal: true

class List::Invitation < ApplicationRecord
  belongs_to :list

  validates :email, presence: true
  validates :email, uniqueness: { scope: :list_id }
end

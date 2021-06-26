# frozen_string_literal: true

class User < ApplicationRecord
  # Associations
  has_many :lists
  has_many :items, through: :lists
  has_many :votes, through: :items
end

# frozen_string_literal: true

class List < ApplicationRecord
  class Configuration
    include StoreModel::Model
  end

  # Store Model Attributes
  attribute :configuration, Configuration.to_type

  # Associations
  belongs_to :user

  has_many :items, class_name: 'Lists::Item'

  # Validations
  validates :configuration, store_model: true

  accepts_nested_attributes_for :items
end

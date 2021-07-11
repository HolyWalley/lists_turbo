# frozen_string_literal: true

class List < ApplicationRecord
  class Configuration
    include StoreModel::Model

    MODES = %i[public private]

    enum :mode, MODES, default: :private

    validates :mode, presence: true
  end

  class PermissionsBitmap < ActiveModel::Type::Integer
    PERMISSIONS = {
      vote: 0,
      check: 1,
      create: 2,
      edit: 3,
      remove: 4
    }

    def cast(value)
      return super(value) if value.is_a?(Integer)

      super(Types::Bitmask[value])
    end

    def deserialize(value)
      self.class.unpack_permissions(value.to_i)
    end

    def serialize(value)
      if value.is_a?(Hash)
        return PERMISSIONS.reduce(0) { |s, (k, v)| value.symbolize_keys[k] ? s |= (1 << v) : s }
      end

      value
    end

    private

    def self.unpack_permissions(compacted)
      PERMISSIONS.each_with_object({}) do |(name, value), obj|
        obj[name] = compacted & (1 << value) > 0
      end
    end
  end

  attribute :permissions, PermissionsBitmap.new
  attribute :anon_permissions, PermissionsBitmap.new

  # Store Model Attributes
  attribute :configuration, Configuration.to_type

  # Associations
  belongs_to :user

  has_many :items, class_name: 'Lists::Item'

  # Validations
  validates :name, presence: true
  validates :configuration, store_model: true

  accepts_nested_attributes_for :items
end

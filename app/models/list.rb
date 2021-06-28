# frozen_string_literal: true

class List < ApplicationRecord
  class Configuration
    include StoreModel::Model

    MODES = %i[public private]

    PERMISSIONS = {
      vote: 0,
      check: 1,
      create: 2,
      edit: 3,
      remove: 4
    }

    # TODO: try move it outside store model
    # and add serialize/deserialize methods
    #
    class PermissionsBitmap < ActiveModel::Type::Integer
      def cast(value)
        return super(value) if value.is_a?(Integer)

        if value.is_a?(Hash)
          super(PERMISSIONS.reduce(0) { |s, (k, v)| value.symbolize_keys[k] ? s |= (1 << v) : s })
          return
        end

        super(Types::Bitmask[value])
      end
    end

    def self.unpack_permissions(compacted)
      PERMISSIONS.each_with_object({}) do |(name, value), obj|
        obj[name] = compacted & (1 << value) > 0
      end
    end

    def permissions
      self.class.unpack_permissions(super)
    end

    def registered_users_permissions
      self.class.unpack_permissions(super)
    end

    enum :mode, MODES, default: :private
    attribute :permissions, PermissionsBitmap.new
    attribute :registered_users_permissions, PermissionsBitmap.new

    validates :mode, presence: true
    validates :permissions, presence: true
  end

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

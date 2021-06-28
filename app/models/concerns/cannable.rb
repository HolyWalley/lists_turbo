# frozen_string_literal: true

module Cannable
  module ClassMethods
    def can_create?(user)
      can_access?("#{model_name.singular}.create", user, self)
    end

    def can_access?(ability, user, model)
      Abilities::A[ability].call(user, model)
    end
  end

  extend ActiveSupport::Concern

  included do
    extend ClassMethods
  end

  def can_read?(user)
    can_access?("#{model_name.singular}.read", user)
  end

  def can_update?(user)
    can_access?("#{model_name.singular}.update", user)
  end

  def can_delete?(user)
    can_access?("#{model_name.singular}.delete", user)
  end

  private

  def can_access?(ability, user)
    self.class.can_access?(ability, user, self)
  end
end

# frozen_string_literal: true

module Abilities
  class List < Base
    register(:read) { |user, list| list.configuration.mode == 'public' || list.user == user }
    register(:update) { |user, list| list.user == user }
    register(:delete) { |user, list| list.user == user }
    register(:create) { |user, _| true }
  end
end

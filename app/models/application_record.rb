# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Cannable

  self.abstract_class = true
end

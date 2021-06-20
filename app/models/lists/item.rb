# frozen_string_literal: true

class Lists::Item < ApplicationRecord
  # Associations
  belongs_to :list, class_name: 'Lists::List'
end

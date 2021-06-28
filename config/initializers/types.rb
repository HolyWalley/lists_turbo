# frozen_string_literal: true

module Types
  include Dry.Types()

  Bitmask = Constructor(Integer) do |values|
    ::Array.wrap(values).map(&:to_i).reduce(0) do |p, value|
      p |= (1 << value)
    end
  end
end

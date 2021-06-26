# frozen_string_literal: true

class VotesComponent < ViewComponent::Base
  def initialize(votes:, item:)
    @votes = votes
    @item = item
  end

  def default
    {
      "\u{1f44d}" => 0,
      "\u{1f44e}" => 0
    }
  end
end

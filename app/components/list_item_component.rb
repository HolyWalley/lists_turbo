# frozen_string_literal: true

class ListItemComponent < ViewComponent::Base
  def initialize(item:, user:)
    @item = item
    @user = user
  end

  def title
    @item.value
  end

  def item_classes
    crossed? && "line-through"
  end

  def votes
    @item.votes.group(:sign).count(:sign)
  end

  private

  def crossed?
    @item.checked
  end
end

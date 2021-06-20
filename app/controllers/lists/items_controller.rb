# frozen_string_literal: true

module Lists
  class ItemsController < ApplicationController
    include ActionView::RecordIdentifier

    def create
      list = @current_user.lists.find(params[:list_id])
      @item = list.items.create!(item_params)

      Turbo::StreamsChannel.broadcast_append_to(
        "#{ dom_id(@item.list) }_items",
        target:  "#{ dom_id(@item.list) }_items",
        partial: "lists/items/item",
        locals:  { item: @item }
      )
    end

    private

    def item_params
      params.require(:lists_item).permit(:value)
    end
  end
end

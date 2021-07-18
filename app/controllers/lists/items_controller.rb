# frozen_string_literal: true

module Lists
  class ItemsController < ApplicationController
    include ActionView::RecordIdentifier

    def create
      @item = list.items.create!(item_params)

      Turbo::StreamsChannel.broadcast_append_to(
        @item.list,
        target:  "#{ dom_id(@item.list) }_items",
        partial: "lists/items/item",
        locals:  { item: @item, user: @current_user }
      )
    end

    def update
      item.update!(item_params)

      Turbo::StreamsChannel.broadcast_replace_to(
        item.list,
        target:  item,
        partial: "lists/items/item",
        locals:  { item: item, user: @current_user }
      )
    end

    def destroy
      item.destroy!

      Turbo::StreamsChannel.broadcast_remove_to(item.list, target: item)
    end

    private

    def item
      @item ||= list.items.find(params[:id])
    end

    def list
      @list ||= @current_user.lists.find(params[:list_id])
    end

    def item_params
      params.require(:list_item).permit(:value, :checked, :last_checked_by_id)
    end
  end
end

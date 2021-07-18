# frozen_string_literal: true

module Lists
  module Items
    class VotesController < ApplicationController
      include ActionView::RecordIdentifier

      def create
        vote = item.votes.where(voted_by: @current_user, **vote_params).first_or_create
        vote.save!

        Turbo::StreamsChannel.broadcast_replace_to(list, target: "#{dom_id(item)}_votes", partial: "lists/items/votes/votes", locals: { item: item, votes: item.votes.group(:sign).count(:sign) })
      end

      private

      def item
        @item ||= list.items.find(params[:item_id])
      end

      def list
        @list ||= @current_user.lists.find(params[:list_id])
      end

      def vote_params
        params.require(:list_item_vote).permit(:sign)
      end
    end
  end
end

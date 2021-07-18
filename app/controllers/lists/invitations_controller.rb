# frozen_string_literal: true

module Lists
  class InvitationsController < ApplicationController
    include ActionView::RecordIdentifier

    def create
      invitation = list.invitations.create!(invitation_params)

      Turbo::StreamsChannel.broadcast_append_to(
        list,
        target:  "#{ dom_id(list) }_invitations",
        partial: "lists/invitations/invitation",
        locals:  { list: list, invitation: invitation }
      )
    end

    def update
      invitation.update!(invitation_params)
    end

    def destroy
      invitation.destroy!

      Turbo::StreamsChannel.broadcast_remove_to(list, target: invitation)
    end

    private

    def invitation_params
      params.require(:list_invitation).permit(:email, :name)
    end

    def invitation
      @invitation ||= list.invitations.find(params[:id])
    end

    def list
      @list ||= List.find(params[:list_id])
    end
  end
end

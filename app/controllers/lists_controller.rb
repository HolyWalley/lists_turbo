# frozen_string_literal: true

class ListsController < ApplicationController
  def new
    @list = @current_user.lists.new
  end

  def show
    return halt(:forbidden) unless list.can_read?(@current_user)

    render :show, locals: { list: list }
  end

  def create
    @list = @current_user.lists.create!(list_params)

    redirect_to list_path(@list.id)
  end

  def update
    list.update!(list_params)

    Turbo::StreamsChannel.broadcast_replace_to list, target: list, partial: "lists/list", locals: { list: list }
  end

  private

  def list
    @list ||= List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, configuration: [:mode, permissions: [], registered_users_permissions: []])
  end
end

# frozen_string_literal: true

class ListsController < ApplicationController
  def new
    @list = @current_user.lists.new
  end

  def show
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
    @list ||= @current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorize

  private

  def authorize
    if user_id = session[:user_id]
      @current_user = User.find_by(id: user_id)
    end

    @current_user = User.create! unless @current_user

    session[:user_id] = @current_user.id
  end
end

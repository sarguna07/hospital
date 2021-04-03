# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorization, only: :login
  def login
    user = User.active.where(email: params[:user_name]).find_by(password: hexdigest(params[:password].to_s))
    reset_session
    if user.blank?
      render json: {
        status: false,
        message: 'Invalid Credentials'
      }, status: :unauthorized
      return
    end

    unless user.active?
      render json: {
        status: false,
        message: 'Account is inactive'
      }, status: :unauthorized
      nil
    end
  end
end

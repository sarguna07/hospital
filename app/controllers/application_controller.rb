# frozen_string_literal: true

require 'csv'
class ApplicationController < ActionController::Base
  include ApplicationHelper

  skip_before_action :verify_authenticity_token

  before_action :authorization

  skip_before_action :authorization, only: :catch_all

  def catch_all
    return_404
  end

  private

  def authorization
    raise Unauthorized unless logged_in?

    true
  end

  def auth_header
    request.headers['Authorization']
  end

  def request_source
    request.headers['Request-Source']
  end

  def auth_header
    request.headers['Authorization']
  end

  def current_user
    @current_user ||= User.active.find_by!(auth_token: auth_header)
  end

  def logged_in?
    return if current_user.blank?

    Ambient.init
    Ambient.current_user = current_user.id
    true
  end
end

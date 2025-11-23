class HomeController < ApplicationController
before_action :require_authentication

  def index
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def razlaga
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

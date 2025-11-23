class ApplicationController < ActionController::Base
  include Authentication
# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
allow_browser versions: :modern

helper_method :current_user, :authenticated?
helper_method :polje

def current_user
@current_user ||= User.find_by(id: session[:user_id])
end

def authenticated?
current_user.present?
end

def authenticate_user
redirect_to new_session_path unless authenticated?
end
end

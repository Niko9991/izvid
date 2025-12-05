class ApplicationController < ActionController::Base
  include Authentication
 # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
 before_action :set_locale
allow_browser versions: :modern

helper_method :current_user, :authenticated?
helper_method :polje

around_action :switch_locale

def switch_locale(&action)
  locale = params[:locale] || I18n.default_locale
  I18n.with_locale(locale, &action)
end


def current_user
@current_user ||= User.find_by(id: session[:user_id])
end

def authenticated?
current_user.present?
end

def authenticate_user
redirect_to new_session_path unless authenticated?
end

private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Optional: make sure locale param stays in generated URLs
  def default_url_options
    { locale: I18n.locale }
  end
end

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :set_locale

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

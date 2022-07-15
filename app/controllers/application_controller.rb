# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user
  before_action :set_query
  before_action :set_categories
  before_action :set_locale

  def set_query
    @query = Post.ransack(params[:q])
  end

  def is_admin!
    redirect_to root_path, alert: 'You are not authorized to do that.' unless current_user&.admin?
  end

  private

  def set_categories
    @nav_categories = Category.where(display_in_nav: true).order(:name)
  end

  # def fff
  #   @notifications = Notification.where(recipient: current_user)
  #   redirect_to root_path, notice: @notifications
  # end
  def set_notifications
    notifications = Notification.includes(:recipient).where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    parsed_locale.to_sym if I18n.available_locales.map(&:to_s).include?(parsed_locale)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name language])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name language])
  end
end

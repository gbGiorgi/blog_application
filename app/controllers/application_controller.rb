class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user
  before_action :set_query
  before_action :set_locale



  def set_query
    @query = Post.ransack(params[:q])
  end

  private
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
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :language])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :language])
  end

end

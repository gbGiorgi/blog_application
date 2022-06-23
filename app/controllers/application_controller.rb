class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user

  private
  # def fff
  #   @notifications = Notification.where(recipient: current_user)
  #   redirect_to root_path, notice: @notifications
  # end
  def set_notifications
    notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
   end
end

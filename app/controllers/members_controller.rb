# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_status

  def dashboard
    @posts = Post.joins(:user).where(approve: true)
                 .includes(:rich_text_body, :user).where(user: { subscription_status: 't' }).paginate(page: params[:page],
                                                                                                      per_page: 5)
  end

  private

  def check_subscription_status
    unless current_user.active_subscription
      redirect_to checkout_path(
        line_items: ['price_1LNDtbEuYLa2Mh04muXlyp1B'],
        payment_mode: 'subscription'
      ), alert: 'You must have an active subscription to access this page.'
    end
  end
end

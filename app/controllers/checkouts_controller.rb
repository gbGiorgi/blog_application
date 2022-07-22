# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user
                        .payment_processor
                        .checkout(
                          mode: params[:payment_mode],
                          line_items: params[:line_items],
                          success_url: checkout_success_url
                        )
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @line_items = Stripe::Checkout::Session.list_line_items(params[:session_id])
    current_user.subscription_status = true
    current_user.subscription_end_date = Time.now + 1.month
    current_user.subscription_start_date = Time.now
    current_user.save
  end
end

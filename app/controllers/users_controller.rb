# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  def profile
    viewer_counter(@user)
    @posts = @user.posts.includes(:rich_text_body).order(created_at: :desc)
    @total_views = 0

    @posts.each do |post|
      @total_views += post.views
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

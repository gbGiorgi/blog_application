# frozen_string_literal: true

class AdminController < ApplicationController
  def index; end

  def posts
    @posts = Post.includes(:user).all.order(:id)
  end

  def comments
    @comments = Comment.all.includes(:user, :post, :rich_text_body).order(:id)
  end

  def users
    @users = User.all.order(:id)
  end

  def show_post
    @post = Post.includes(:user, comments: %i[user rich_text_body]).find(params[:id])
  end

  def show_user
    @user = User.find(params[:id])
    # @posts = Post.where(:user_id == @user.id).includes(:rich_text_body)
    @approved_posts = @user.posts.where(approve: true)
    @not_approved_posts = @user.posts.where(approve: false)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User deleted.' if @user.destroy
  end
end

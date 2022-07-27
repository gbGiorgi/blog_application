# frozen_string_literal: true

class AdminController < ApplicationController
  def index; end

  def posts
    @posts = Post.includes(:user).all
  end

  def comments
    @comments = Comment.all.includes(:user, :post, :rich_text_body)
  end

  def users
    @users = User.all
  end

  def show_post
    @post = Post.includes(:user, comments: %i[user rich_text_body]).find(params[:id])
  end

  def show_user
    @user = User.find(params[:id])
    @posts = Post.all.where(:user_id == @user.id).includes(:rich_text_body)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to admin_users_path, notice: 'User deleted.'
    end
  end
end

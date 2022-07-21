# frozen_string_literal: true

class AdminController < ApplicationController
  def index; end

  def posts
    @posts = Post.includes(:user).all.includes(:user)
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
end

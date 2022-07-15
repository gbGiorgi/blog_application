# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @query = Post.includes(:user, :rich_text_body, :category).ransack(params[:q])
    @posts = @query.result
  end
end

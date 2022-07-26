# frozen_string_literal: true

class CommentNotification < Noticed::Base
  deliver_by :database

  def message
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.name} #{t(:commented_on)} #{@post.title.truncate(10)}"
  end

  def url
    "/posts/#{params[:comment][:post_id]}"
  end
end

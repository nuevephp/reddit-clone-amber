class CommentController < ApplicationController
  getter comment = Comment.new

  before_action do
    only [:destroy] { set_comment }
  end

  def create
    post = Post.find! params[:post_id]
    comment = Comment.new comment_params.validate!
    comment.post = post
    if user = current_user
      comment.user = user
    else
      redirect_to controller: :post, action: :index, flash: {"danger" => "You need to be logged in"}
    end

    if comment.save
      redirect_back flash: {"success" => "Comment has been created."}
    else
      redirect_back flash: {"danger" => "Could not create Comment!"}
    end
  end

  def destroy
    comment.destroy
    redirect_back flash: {"success" => "Deleted comment successfully."}
  end

  private def comment_params
    params.validation do
      required :post_id
      required :body
    end
  end

  private def set_comment
    @comment = Comment.find! params[:id]
  end
end

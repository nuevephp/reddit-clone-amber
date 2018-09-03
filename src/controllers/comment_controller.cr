class CommentController < ApplicationController
  getter comment = Comment.new

  before_action do
    only [:destroy] { set_comment }
  end

  def create
    post = Post.find! params[:link_id]
    comment = Comment.new comment_params.validate!
    comment.post = post
    if user = current_user
      comment.user = user
    else
      redirect_to action: :index, flash: {"danger" => "You need to be logged in"}
    end
    
    if comment.save
      redirect_to action: :index, flash: {"success" => "Created comment successfully."}
    else
      flash["danger"] = "Could not create Comment!"
      render "new.slang"
    end
  end

  def destroy
    comment.destroy
    redirect_back, flash: {"success" => "Deleted comment successfully."}
  end

  private def comment_params
    params.validation do
      required :post_id { |f| !f.nil? }
      required :body { |f| !f.nil? }
      required :user_id { |f| !f.nil? }
    end
  end

  private def set_comment
    # post = Post.find! params[:id]
    # @comment = post.comments.new(comment_params)
    @comment = Comment.find! params[:id]
  end
end

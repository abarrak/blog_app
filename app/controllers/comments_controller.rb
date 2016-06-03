class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.build comment_params
    if @comment.save
      flash[:success] = "comment added."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = @post.comments.find params[:id]
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

    def find_post
      @post = Post.find params[:post_id]
    end

    def comment_params
      params.require(:comment).permit :commenter, :text
    end
end

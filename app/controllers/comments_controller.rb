class CommentsController < ApplicationController
  before_action :find_post
  http_basic_authenticate_with name: 'admin', password: '111', only: [:destroy]
  
  def create
    @comment = Comment.new comment_params
    @comment.post = @post
    if @comment.save
      flash[:success] = "comment added."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = @post.comments.find params[:id]
    if @comment.destroy
      flash[:success] = "comment added."
    else
      flash[:danger] = "comment couldn't be deleted."
    end
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

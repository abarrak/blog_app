class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: 'admin', 
                               password: '111', 
                               except: [:index, :show, :search]
                               
  def index
    @posts = Post.all.order created_at: :desc
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = "Post was created successfully."
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post was updated successfully."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post was deleted successfully."
    else
      flash[:danger] = "Deleting post failed. Please try again."
    end
    redirect_to posts_url
  end

  def search
  end

  private
    
    def find_post
      @post = Post.find params[:id]
    end

    def post_params
      params.require(:post).permit :title, :content
    end
end

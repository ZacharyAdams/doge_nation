class PostsController < ApplicationController
   before_action :authenticate_user!, except: [:home]

  def index
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def home
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Success'
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    if current_user?
      @post = Post.find(params[:id])
      if @post.destroy
        flash[:notice] = 'Post deleted!'
        redirect_to posts_path
      end
    end
  end

 private

  def post_params
    params.require(:post).permit(:title, :body, :uid)
  end

end

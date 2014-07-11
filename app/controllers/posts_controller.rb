class PostsController < ApplicationController
   before_action :authenticate_user!, except: [:home]
   before_action :authorize_user, only: [:new, :create, :destroy, :edit]

  def index
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def home
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Success'
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    if current_user
      @post = Post.find(params[:id])
      if @post.destroy
        flash[:notice] = 'Post deleted!'
        redirect_to posts_path
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    verify_authorized!(@post)
  end

  def update
    @post = Post.find(params[:id])
    verify_authorized!(@post)
    if @post.update(post_params)
      redirect_to(@post)
    else
      flash.now[:notice] = 'Much Fail, Very Sad, Edit Failed'
      render :edit
    end
  end

 private

  def verify_authorized!(post)
    if current_user != post.user
      flash[:notice] = 'You did not make this post! Random Shibe.'
      redirect_to post_path
    end
  end

  def authorize_user
    unless user_signed_in? and current_user
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :uid)
  end

end

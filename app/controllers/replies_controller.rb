class RepliesController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :destroy, :edit]
 def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)
    @reply.user = current_user
    @user = @reply.user

    if @reply.save
      flash[:notice] = 'Your reply was saved!'
      redirect_to post_path(@post)
    else
      @post.replies.delete(@reply)
      flash[:notice] = 'Your reply could not be saved'
      render 'posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @reply = Reply.find(params[:id])
    if @reply.destroy
      flash[:notice] = 'Reply deleted!'
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      flash[:notice] = 'Changes saved!'
      redirect_to post_path(@post)
    end
  end

  private

  def authorize_user
    unless user_signed_in? and current_user
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end


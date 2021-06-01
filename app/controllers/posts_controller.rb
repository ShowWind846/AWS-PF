class PostsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to user_mypage_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_mypage_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_mypage_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :contents, :post_image, :category, :user_id)
  end
end

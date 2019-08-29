class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to root_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if current_user.posts.include?(@post)
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :content, :title)
  end

end

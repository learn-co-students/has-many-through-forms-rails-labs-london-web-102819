class PostsController < ApplicationController
  def show
    
    @post = Post.find(params[:id])
    @usernames = @post.users.group(:username).pluck(:username, :id)
    @comment = Comment.new
    
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    
    
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end

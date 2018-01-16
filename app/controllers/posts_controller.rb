class PostsController < ApplicationController
  def index
    @posts=Post.all
  end
  def new
    @post=Post.new
  end
  def show
    @post=Post.find_by_id(params[:post_id])
    @user=User.find_by_id(params[:id])
  end
end

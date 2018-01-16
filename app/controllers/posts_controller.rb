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
  def destroy
    @post=Post.find_by_id(params[:post_id])
    @user=User.find_by_id(params[:id])
    @post.destroy
    redirect_to user_path(@user)
  end
  def edit
    @post=Post.find_by_id(params[:post_id])
    @user=User.find_by_id(params[:id])
  end
  def update
    @post=Post.find_by_id(params[:post_id])
    @user=User.find_by_id(params[:id])
    if @post.update(post_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      redirect_to edit_user_post(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
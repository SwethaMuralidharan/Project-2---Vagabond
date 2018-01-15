class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
     @user = User.create(user_params)
     login(@user)
     redirect_to @user
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
     user_id = params[:id]
     user = User.find_by_id(user_id)
     user.update_attributes(user_params)
     redirect_to user_path(current_user)
  end

  private

  def user_params
      params.require(:user).permit(:firstname, :lastname, :current_city, :email, :password)
  end



end

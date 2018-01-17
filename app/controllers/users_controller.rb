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
    @user=User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:notice] = "Please provide all the information to create a new account."
      flash[:notice] = @user.errors.full_messages.join(" , ")
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    if current_user.id === params[:id].to_i
     user_id = params[:id]
     user = User.find_by_id(user_id)
     user.update_attributes(user_params)
     redirect_to user_path(current_user)
   else
     flash[:notice]="Stop Hacking others profile information."
     redirect_to user_path(current_user)
   end
  end

  private

  def user_params
      params.require(:user).permit(:avatar,:firstname, :lastname, :current_city, :email, :password)
  end



end

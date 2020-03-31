class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show 
    @user = User.find params[:id]
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted!"
    redirect_to users_path
  end
end

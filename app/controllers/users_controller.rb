class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
 
  def index
    @users = User.all
    authorize User
  end

  def show 
    @user = User.find params[:id]
    authorize @user
  end

  def update
    @user = User.find params[:id]
    authorize @user 

    if @user.update_attributes secure_params
      flash[:success] = "User updated"
      redirect_to users_path 
    else
      flash[:alert] = "Unable to update user"
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find params[:id]
    authorize @user
    @user.destroy
    flash[:success] = "User deleted!"
    redirect_to users_path
  end

  private 
    def secure_params
      params.require(:user).permit :role
    end
end

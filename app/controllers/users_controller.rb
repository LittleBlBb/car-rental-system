class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created!"
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
  end

  def show
  end
  def update
    if @user.update(user_params)
      flash[:success] = "User successfully updated!"
      redirect_to users_path
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User successfully deleted!"
    redirect_to users_pathq
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :vip)
  end
end

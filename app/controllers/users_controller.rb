class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to accounts_path, notice: "New User was successfully created by Admin"
    else
      render :new, error: "Failed to create new User by Admin"
    end
  end

  def update
    if @user.update(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to accounts_path, notice: "User successfully updated"
    else
      render :edit, error: "Failed to update User"
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path, flash: "User successfully destroyed"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_type, :email, :username, :password, :password_confirmation)
  end
end

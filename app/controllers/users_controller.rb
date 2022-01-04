class UsersController < ApplicationController
  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_type, :email, :username, :password, :account_id)
  end
end

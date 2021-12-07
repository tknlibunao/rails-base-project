class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy, :show]
  def index
    @admins = Admin.all
  end

  private

  def set_admin
      @admin = Admin.find(params[:id])
  end

  def delete
    redirect_to index
  end

  
  def admin_params
      params.require(:admin).permit(:email, :username, :fullname, :password)
  end
end

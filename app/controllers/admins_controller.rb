class AdminsController < ApplicationController
    before_action :set_admin, only: [:edit, :update, :destroy]

    def index
        @admins = Admin.all
    end

    def new
        @admin = Admin.new
    end

    def show
        @admins = @admin.where.not(id: nil)
        
    end

    def create
        @admin = Admin.new(admin_params)

        if @admin.save
            flash[:notice] = "A new admin has been added"
            redirect_to admins_path
        else
            flash[:error] = "There are some errors encountered"
            render :new
        end
    end

    def edit
        @admin = Admin.find(params[:id])
    end

    def update

        if @admin.update(admin_params)
            redirect_to admins_path
        else
            render :edit
        end
    end

    def destroy
        @admin.destroy
        redirect_to admins_path, notice: "The admin was successfully deleted"
    end

    private

    def set_admin
        @admin = Admin.find(params[:id])
    end

    def admin_params
        params.require(:admin).permit(:username, :email, :fullname, :password)
    end
end

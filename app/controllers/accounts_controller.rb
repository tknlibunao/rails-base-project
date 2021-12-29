class AccountsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_account, only: [:edit, :update, :destroy, :show]

    def index
        @accounts = Account.all
    end

    def new
        @account = Account.new
    end

    def show
        @account = Account.find(params[:id])
        
    end

    def create
        @account = Account.new(account_params)

        if @account.save
            flash[:notice] = "A new account has been added"
            redirect_to accounts_path
        else
            flash[:error] = "There are some errors encountered"
            render :new
        end
    end

    def edit
        @account = Account.find(params[:id])
    end

    def update

        if @account.update(account_params)
            redirect_to accounts_path
        else
            render :edit
        end
    end

    def destroy
        @account.destroy
        redirect_to accounts_path, notice: "The account was successfully deleted"
    end

    private

    def set_account
        @account = Account.find(params[:id])
    end

    def account_params
        params.require(:account).permit(:first_name, :last_name, :contact_number, :address, :verified, :verified_at)
    end
end

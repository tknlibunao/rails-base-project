class WalletsController < ApplicationController
    load_and_authorize_resource  

    before_action :authenticate_user!
    before_action :set_wallet, only: [:edit, :update, :destroy, :show]

    def index
        @wallets = Wallet.all
    end

    def new
        @wallet = Wallet.new
    end

    def show
        @wallet = Wallet.find(params[:id])
        
    end

    def create
        @wallet = Wallet.new(wallet_params)
        #@wallet.user_id = current_user.id

        if @wallet.save
            flash[:notice] = "A new wallet has been added"
            redirect_to wallets_path
        else
            flash[:error] = "There are some errors encountered"
            render :new
        end
    end

    def edit
        @wallet = Wallet.find(params[:id])
    end

    def update

        if @wallet.update(wallet_params)
            redirect_to wallets_path
        else
            render :edit
        end
    end

    def destroy
        @wallet.destroy
        redirect_to wallets_path, notice: "The wallet was successfully deleted"
    end

    private

    def set_wallet
        @wallet = Wallet.find(params[:id])
    end

    def wallet_params
        params.require(:wallet).permit(:buyer_id, :actual_balance)
    end
end

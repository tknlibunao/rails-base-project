class WalletsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_wallet, only: [:edit, :update, :destroy, :show]
    load_and_authorize_resource

    def index
        @wallets = Wallet.all
    end

    # def new
    #     @wallet = Wallet.new
    # end

    def show        
    end

    def create
        # @wallet = Wallet.new(wallet_params)
        
        @wallet = @account.wallet.build(wallet_params)  

        if @wallet.save
            flash[:notice] = "A new wallet has been added"
            redirect_to wallet_path(@wallet)
        else
            flash[:error] = "There are some errors encountered"
            render account_path(@account)
        end
    end

    def edit
    end

    def update

        if @wallet.update(wallet_params)
            redirect_to wallet_path(@wallet)
        else
            render :edit
        end
    end

    def destroy
        @wallet.destroy
        redirect_to wallets_path, notice: "The wallet was successfully deleted"
    end

    private

    def set_account
      begin
        @account = Account.find(params[:account_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url
        p 'Redirected to home'
      end
    end

    def set_wallet
        begin
            @wallet = Wallet.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to root_url
            p 'Redirected to home'
        end
    end

    def wallet_params
        params.require(:wallet).permit(:actual_balance)
    end
end

class BuyerController < ApplicationController
    before_action :set_buyer, only: [:edit, :update, :destroy, :show]

    def index
        @buyers = Buyer.all
    end

    def new
        @buyer = Buyer.new
    end

    def show
        @buyer = Buyer.find(params[:id])
        
    end

    def create
        @buyer = Buyer.new(buyer_params)

        if @buyer.save
            flash[:notice] = "A new buyer has been added"
            redirect_to buyers_path
        else
            flash[:error] = "There are some errors encountered"
            render :new
        end
    end

    def edit
        @buyer = Buyer.find(params[:id])
    end

    def update

        if @buyer.update(buyer_params)
            redirect_to buyers_path
        else
            render :edit
        end
    end

    def destroy
        @buyer.destroy
        redirect_to buyers_path, notice: "The buyer was successfully deleted"
    end

    private

    def set_buyer
        @buyer = Buyer.find(params[:id])
    end

    def buyer_params
        params.require(:buyer).permit(:first_name, :last_name, :contact_number, :address, :verified, :verified_at, :created_by, :admin_id)
    end
end
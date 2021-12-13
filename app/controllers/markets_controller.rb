class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def show
  end

  def create
    @market = Market.new(market_params)

    if @market.save
      redirect_to markets_path, notice: 'A market was successfully created'
    else
      render :new, error: 'Market cannot be created due to some errors'
    end
  end

  def edit
  end

  def update
    if @market.update(market_params)
      redirect_to markets_path, notice: 'Market successfully updated'
    else
      render :edit, error: 'Market cannot be updated due to some errors'
    end
  end

  def destroy
    @market.destroy

    redirect_to markets_path, notice: 'Market successfully destroyed'
  end

  private

  def set_market
    begin
      @market = Market.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to new_market_path
      p 'Redirect to new market'
    end
  end

  def market_params
    params.require(:market).permit(:stock_name, :symbol, :volume, :trades, :buying_price, :selling_price)
  end

end

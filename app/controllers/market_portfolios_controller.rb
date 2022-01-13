class MarketPortfoliosController < ApplicationController
  # before_action :set_market, :set_portfolio
  
  def new
    @market = Market.find(params[:market_id])
    @portfolio = current_user.account.portfolio
    @wallet = current_user.account.wallet
    @market_portfolio = MarketPortfolio.new
  end

  def create
    # @market = Market.find(params[:market_id])
    @market_portfolio = MarketPortfolio.new(market_portfolio_params)

    # @market_portfolio.portfolio = current_user.account.portfolio
    # @market_portfolio.market = market
    
    # @market_portfolio = @portfolio.market_portfolio.build(market_portfolio_params)

    if @market_portfolio.save
      redirect_to markets_path, notice: "Transaction successful!"
    else
      render :new, error: "Transaction failed"
    end
  end

  private

  def set_market
    @market = Market.find(params[:id])
  end

  def set_portfolio
    # @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio = current_user.account.portfolio
  end
  
  def set_market_portfolio
    @market_portfolio = MarketPortfolio.find(params[:id])
  end

  def market_portfolio_params
    params.require(:market_portfolio).permit(:price_bought, :volume_bought, :price_sold, :volume_sold, :transaction_type, :market_id, :portfolio_id)  
  end
end

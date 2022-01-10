class MarketPortfoliosController < ApplicationController
  def new
    @market_portfolio = MarketPortfolio.new
  end

  def create

  end

  private

  def set_market
    @market = Market.find(params[:market_id])
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end
  
  def set_market_portfolio
    @market_portfolio = MarketPortfolio.find(params[:id])
  end

  def market_portfolio_params
    params.require(:market_portfolio).permit(:price_bought, :volume_bought)  
  end
end

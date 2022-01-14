class LogsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @portfolio = current_user.account.portfolio
    @logs = Log.where(portfolio_id: @portfolio.id)
  end

  def show
  end
  
  def new
    @log = Log.new
    @market = Market.find(params[:market_id])
    @portfolio = current_user.account.portfolio
    @wallet = current_user.account.wallet
    @units_owned = compute_units_owned(@market)
  end

  def create
    @log = Log.new(log_params)
    # @log = @portfolio.log.build(log_params)
    
    check_transaction(@log)
    
    # if @log.save
    #   redirect_to portfolios_path, notice: "Transaction successful"
    # else
    #   render :new, error: "Transaction failed"
    # end

  end

  private

  def check_transaction(log)
    @wallet = current_user.account.wallet
    @market = Market.find(params[:market_id])

    case log.kind
    when "Buy"
      # check if wallet balance >= price_bought and market volume >= volume bought
      @wallet.actual_balance = current_user.account.wallet.actual_balance - log.price_bought
      @market.volume = log.market.volume - log.price_bought/log.market.buying_price

      # proceed with transaction if wallet balance > 0 after
      if @wallet.actual_balance >= 0 && @market.volume >= 0
        if log.save
          if @wallet.save && @market.save
            redirect_to portfolios_path, notice: "Transaction successful"
          else
            redirect_back fallback_location: portfolios_path, alert: "Error in updating wallet and/or market"
          end
        else
          redirect_back fallback_location: portfolios_path, alert: "Transaction failed"
        end
      elsif @wallet.actual_balance < 0
        redirect_back fallback_location: portfolios_path, alert: "Ooops! Insufficient funds. Please cash in first or reduce your purchase."
      elsif @market.volume < 0
        redirect_back fallback_location: portfolios_path, alert: "Ooops! Insufficient market volume. Please check stock volume available."
      end
    when "Sell"
      # check if stock units >= volume_sold
      @remaining_units = compute_stock_units(log) - log.volume_sold

      # proceed with transaction if stock units > 0 after
      if @remaining_units >= 0
        if log.save
          @wallet.actual_balance = current_user.account.wallet.actual_balance + compute_stock_revenue(log)
          @market.volume = @market.volume + log.volume_sold
          if @wallet.save && @market.save
            redirect_to portfolios_path, notice: "Transaction successful"
          else
            redirect_back fallback_location: portfolios_path, alert: "Error in updating wallet and/or market"
          end
        else
          redirect_back fallback_location: portfolios_path, alert: "Transaction failed"
        end
      else
        redirect_back fallback_location: portfolios_path, alert: "Oh no! Can't sell what you don't have. Please check the volume you own."
      end
    else
    end
  end

  def compute_stock_revenue(log)
    log.volume_sold * log.market.selling_price
  end

  def compute_stock_units(log)
    @stocks = Log.where(portfolio_id: current_user.account.portfolio.id, market_id: log.market_id)
    
    units_bought = @stocks.sum(:price_bought)/log.market.buying_price
    units_sold = @stocks.sum(:volume_sold)

    units_bought - units_sold
  end

  def compute_units_owned(market)
    @stock_logs = Log.where(portfolio_id: current_user.account.portfolio.id, market_id: market.id)

    unless @stock_logs.empty?
      if @stock_logs.count > 1
        units_bought = @stock_logs.sum(:price_bought)/market.buying_price
        units_sold = @stock_logs.sum(:volume_sold)
        units_bought - units_sold
      else
        @stock_logs[0].price_bought/@stock_logs[0].market.buying_price
      end
    else
      0.0
    end
  end

  def log_params
    params.require(:log).permit(:price_bought, :volume_bought, :price_sold, :volume_sold, :kind, :market_id, :portfolio_id)
  end

end

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

    case log.kind
    when "Buy"
      # check if wallet balance >= price_bought
      @wallet.actual_balance = current_user.account.wallet.actual_balance - log.price_bought
      
      # proceed with transaction if wallet balance > 0 after
      if @wallet.actual_balance.positive?
        if log.save
          if @wallet.save
            redirect_to portfolios_path, notice: "Transaction successful"
          else
            redirect_back fallback_location: portfolios_path, alert: "Error in updating wallet"
          end
        else
          redirect_back fallback_location: portfolios_path, alert: "Transaction failed"
        end
      else
        redirect_back fallback_location: portfolios_path, alert: "Please check your wallet balance"
      end
    when "Sell"
      # check if stock units >= volume_sold
      remaining_units = compute_stock_units(log) - log.volume_sold

      # proceed with transaction if stock units > 0 after
      if remaining_units.positive?
        if log.save
          @wallet.balance = current_user.account.wallet.actual_balance + compute_stock_revenue(log)
          if @wallet.save
            redirect_to portfolios_path, notice: "Transaction successful"
          else
            redirect_back fallback_location: portfolios_path, alert: "Error in updating wallet"
          end
        else
          redirect_back fallback_location: portfolios_path, alert: "Transaction failed"
        end
      else
        redirect_back fallback_location: portfolios_path, alert: "Please check your owned stocks"
      end
    else
    end
  end

  def compute_stock_revenue(log)
    log.volume_sold * log.market.selling_price
  end

  def compute_stock_units(log)
    @stocks = Log.where(portfolio_id: @portfolio.id, market_id: log.market_id)
    
    units_bought = @stocks.sum(:price_bought)/log.market.buying_price
    units_sold = @stocks.sum(:volume_sold)

    units_bought - units_sold
  end

  def log_params
    params.require(:log).permit(:price_bought, :volume_bought, :price_sold, :volume_sold, :kind, :market_id, :portfolio_id)
  end

end

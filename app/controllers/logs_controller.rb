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
        if @log.save
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
      
    else
    end
  end

  def log_params
    params.require(:log).permit(:price_bought, :volume_bought, :price_sold, :volume_sold, :kind, :market_id, :portfolio_id)
  end

end

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
    
    if @log.save
      redirect_to portfolios_path, notice: "Transaction successful"
    else
      render :new, error: "Transaction failed"
    end

  end

  private

  def log_params
    params.require(:log).permit(:price_bought, :volume_bought, :price_sold, :volume_sold, :kind, :market_id, :portfolio_id)
  end

end

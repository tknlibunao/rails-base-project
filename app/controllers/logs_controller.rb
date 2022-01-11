class LogsController < ApplicationController
  before_action :set_portfolio, :set_logs

  def index
  end

  def show
  end
  
  def new
    @log = Log.new
    @market = Market.find(params[:market_id])
    @wallet = current_user.account.wallet
  end

  def create
    @log = Log.new(log_params)
    # @log = @portfolio.log.build(log_params)

    if @log.save
      redirect_to portfolio_path(@portfolio), notice: "Transaction successful"
    else
      render :new, error: "Transaction failed"
    end

  end

  private

  def set_portfolio
    @portfolio = current_user.account.portfolio
  end

  def set_logs
    @logs = Log.where(portfolio_id: @portfolio.id)
  end

  def log_params
    params.require(:log).permit(:price_bought, :volume_bought, :price_sold, :volume_sold, :kind, :market_id, :portfolio_id)
  end

end

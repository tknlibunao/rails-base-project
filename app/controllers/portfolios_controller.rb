class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def show
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolios_path, notice: 'A portfolio was successfully created'
    else
      render :new, error: 'Portfolio cannot be created due to some errors'
    end
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to portfolios_path, notice: 'Portfolio successfully updated'
    else
      render :edit, error: 'Portfolio cannot be updated due to some errors'
    end
  end

  def destroy
    @portfolio.destroy

    redirect_to portfolios_path, notice: 'Portfolio successfully destroyed'
  end

  private

  def set_portfolio
    begin
      @portfolio = Portfolio.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to new_portfolio_path
      p 'Redirected to new portfolio'
    end
  end

  def portfolio_params
    params.require(:portfolio).permit(:buyer_id)
  end
end

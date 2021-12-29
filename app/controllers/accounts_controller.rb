class AccountsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def show
  end

  def create
    @account = Account.new(account_params)
    
    if @account.save
      redirect_to accounts_path, notice: 'An account was successfully created'
    else
      render :new, error: 'Account cannot be created due to some errors'
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path, notice: 'Account successfully updated'
    else
      render :edit, error: 'Account cannot be updated due to some errors'
    end
  end

  def destroy
    @account.destroy

    redirect_to accounts_path, notice: 'Account successfully destroyed'
  end

  private

  def set_account
    begin
      @account = Account.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to new_account_path
      p 'Redirected to new portfolio'
    end
  end

  def account_params
    params.require(:account).permit(:first_name, :last_name, :contact_number, :address, :verified, :verified_at)
  end
end

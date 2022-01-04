class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.user_type == 'Admin'
      accounts_path
    elsif resource.user_type == 'Buyer'
      if resource.account.verified
        account_path(:id => current_user.account.id)
      else
        wallets_path
      end
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end

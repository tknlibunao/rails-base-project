class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.user_type == 'Admin'
      accounts_path
    else
      accounts_path
    end
  end
end

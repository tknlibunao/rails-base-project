class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.user_type == 'Admin'
      admins_path
    else
      buyers_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end

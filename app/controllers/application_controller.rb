class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
	Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
  end

  def after_sign_in_path_for(resource)
  	if resource.chain_id.nil?
  		new_chain_path
  	else
  		if resource.has_role? :superadmin
  			malls_path
  		else
  			orders_path
  		end
  	end
  end

  def after_sign_up_path_for(resource)
  	if resource.chain_id.nil?
  		new_chain_path
  	else
  		if resource.has_role? :superadmin
  			malls_path
  		else
  			orders_path
  		end
  	end
  end

  def after_confirmation_path_for(resource_name, resource)
    if resource.chain_id.nil?
      new_chain_path
    else
      if resource.has_role? :admin
        orders_path
      else
        malls_path
      end

    end
  end
  
end

class ApplicationController < ActionController::Base 
	protect_from_forgery
	before_filter :set_profile_id
	
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
	
	def set_zone(zone)
		@zone = zone
	end
	
	def set_profile_id
		@profile_id = current_user.profile.id
		logger.debug "set_profile -> #{@profile.inspect}"
	end
	
end

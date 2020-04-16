class ApplicationController < ActionController::Base
	before_action :set_locale 

	helper_method :logout
	def logout
    reset_session
    redirect_to :root
	end
	
	private
	def require_signin
		unless current_user
			session[:intended_url] = request.url
			redirect_to new_session_url, alert: t('common.require_signin')
		end
	end

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options(options = {})
		{locale: I18n.locale}.merge options
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user
	
	def current_user?(user)
		current_user == user
	end
	

	helper_method :current_user?

	def require_admin
		unless current_user_admin?
			redirect_to root_url, alert: t('common.no_access')
		end
	end


	def current_user_admin?
		current_user || current_user.try(:admin?)
	end

	helper_method :current_user_admin?
end

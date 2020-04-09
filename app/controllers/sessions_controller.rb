class SessionsController < ApplicationController
	def new
	end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			flash[:notice] = t('action.welcome_back', name: user.name)
			redirect_to(session[:intended_url] || user)
			session[:intended_url] = nil
		else
			flash.now[:alert] = t('action.invalid_sign_in')
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: t("action.sign_out")
	end
end

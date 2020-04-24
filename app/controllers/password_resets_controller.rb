class PasswordResetsController < ApplicationController
def new
end 

def create 
		user = User.find_by_email(params[:email])
		if user
				user.send_password_reset  
		else
				return redirect_to new_password_reset_path, 
				:notice => t('common.email_not_found')
		end 
		return redirect_to root_url, :notice => t('common.email_with_instructions')
end

	def edit
			@user = User.find_by_reset_password_token!(params[:id])
			respond_to do |format|
					format.html { render "edit" }
					format.js { render "edit" }
			end 
	end 

	def update
		@user = User.find_by_reset_password_token!(params[:id])
		if @user.reset_password_sent_at < 2.hour.ago
			flash[:notice] = t('common.pass_expired')
			redirect_to new_password_reset_path
		elsif @user.update(user_params)
			flash[:notice] = t('common.pass_reset')
			redirect_to new_session_path
		else
			render :edit
		end
	end 
	private

  def user_params
    params.require(:user).permit(:password)
  end
end
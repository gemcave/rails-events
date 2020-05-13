class UserMailer < ApplicationMailer
	default :from => Rails.application.credentials.DEFAULT_EMAIL

	def password_reset(user)
			@user = user 
			mail :to => user.email, :subject => "Password Reset", content_type => "text/html"
	end
end

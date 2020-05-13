
ActionMailer::Base.smtp_settings = {
	:user_name => 'apikey',
	:password => Rails.application.credentials.SG_API_KEY,
	:domain         => '3000',
	:address => 'smtp.sendgrid.net',
	:port => 587,
	:authentication => :plain,
	:enable_starttls_auto => true
}
# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
	:user_name => 'apikey',
	:password => Rails.application.credentials.SG_API_KEY,
	:domain => 'blooming-garden-65144.herokuapp.com',
	:address => 'smtp.sendgrid.net',
	:port => 465,
	:authentication => :plain,
	:enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!

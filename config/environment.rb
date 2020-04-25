# Load the Rails application.
require_relative 'application'

# ActionMailer::Base.smtp_settings = {
# 	:address        => 'smtp.sendgrid.net',
# 	:port           => '465',
# 	:authentication => :plain,
# 	:user_name => ENV['SENDGRID_PASSWORD'],
# 	:password => ENV['SENDGRID_PASSWORD'],
# 	:domain         => 'localhost:3000',
# 	:enable_starttls_auto => true
# }

  # ActionMailer::Base.smtp_settings = {
  #   :address        => 'smtp.sendgrid.net',
  #   :port           => 465,
  #   :authentication => :plain,
  #   :user_name => ENV['SENDGRID_PASSWORD'],
	# 	:password => ENV['SENDGRID_PASSWORD'],
  #   :domain         => 'localhost:3000',
  #   :enable_starttls_auto => true
	# }
	

# Initialize the Rails application.
Rails.application.initialize!

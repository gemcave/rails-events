source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
group :development, :test do
	gem 'sqlite3', '~> 1.4'
end
group :production do
	gem 'pg'
end

gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'rails-i18n', '~> 6.0.0'
gem 'devise-i18n'
gem 'devise'
gem 'activeadmin'
gem 'image_processing', '~> 1.2'
gem 'aws-sdk-s3', require: false
gem 'travis'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'rspec-rails'
gem 'will_paginate', '~> 3.1.0'
gem 'kaminari'
gem 'sendgrid-actionmailer'
gem 'pay', '~> 2.0'
gem 'stripe', '< 6.0', '>= 2.8'
gem 'stripe_event', '~> 2.3'
gem 'braintree', '< 3.0', '>= 2.92.0'
gem 'receipts', '~> 1.0.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source "https://rubygems.org"

ruby File.read(".ruby-version").strip

gem "rails", "~> 7.0"
gem "pg", "~> 1.4"
gem "puma", "~> 6.4"
gem "bootsnap", "~> 1.13", require: false
gem "devise", "~> 4.8"
gem "omniauth-facebook", "~> 9.0"
gem "omniauth-github", "~> 2.0"
gem "omniauth-google-oauth2", "~> 1.1"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "cancancan", "~> 3.4"
gem "ransack", "~> 4.1.1"
gem "pagy", "~> 5.10"
gem "image_processing", "~> 1.2"
gem "faker", "~> 2"
gem 'down'
# Front-end
gem "sprockets-rails", "~> 3.4"
gem "jsbundling-rails", "~> 1.0"
gem "cssbundling-rails", "~> 1.1"
gem "turbo-rails", "~> 1.3"
gem "heroicon", "~> 1.0"

group :development do
  gem "web-console"
  gem "debug"
  gem "dotenv-rails"
end
group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end
group :test do
  gem 'shoulda-matchers', '~> 6.0'
  gem 'capybara'
end
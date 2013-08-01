source 'https://rubygems.org'
ruby '2.0.0'

gem 'authem'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'decent_exposure'
gem 'draper'
gem 'faker'
gem 'fabrication'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'phony_rails'
gem 'rails', '3.2.14'

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'sqlite3'
  gem 'chronic'
end

group :test do
  gem "cucumber-rails", require: false
  gem 'capybara-email'
  gem "database_cleaner"
  gem 'email_spec'
  gem 'capybara-webkit'
end

group :development do
  gem 'letter_opener'
end

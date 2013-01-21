source 'https://rubygems.org'
ruby '1.9.3'

gem 'authem', '1.0.0rc3'
gem 'decent_exposure'
gem 'draper'
gem 'faker'
gem 'fabrication'
gem 'haml-rails'
gem 'jquery-rails'
gem 'phony_rails'
gem 'rails', '3.2.11'

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'sqlite3'
end

group :test do
  gem "cucumber-rails"
  gem 'capybara-email'
  gem "database_cleaner"
  gem 'email_spec'
end

group :development do
  gem 'letter_opener'
end

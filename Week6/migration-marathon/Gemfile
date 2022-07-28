source "https://rubygems.org"

gem "activerecord", "~> 6.1"
gem "pg", "~> 1.0"
gem "puma"
gem "rake"
gem "sinatra", "~> 2.1"
gem "sinatra-activerecord", "~> 2.0"
gem "sinatra-contrib"
gem "sinatra-flash"

group :test, :development do
  gem "pry"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "rspec", "~> 3.4"
  gem "shoulda"
  gem "shoulda-matchers", "~> 3.1", require: false
  gem "valid_attribute"
end

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~>3.1.12"
gem "bootstrap-sass", "~> 3.3.7"
gem "bootstrap-will_paginate", "~>1.0.0"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick", "~> 4.7.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6", ">= 5.1.6.1"
gem "ransack"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "~>3.1.6"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "sqlite3", "1.3.13"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

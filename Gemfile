source "http://rubygems.org"

gem "sinatra"
gem 'json'
gem 'rake'
gem "faraday"
gem 'activesupport'
gem 'rack-contrib', git: 'git@github.com:rack/rack-contrib', ref: 'b7237381e412852435d87100a37add67b2cfbb63'

platforms :jruby do
  gem "jruby-openssl"
  gem 'torquebox-server', :group => 'development'
  gem 'torquebox-rake-support'
end

platforms :mri do
  gem 'thin'
  gem 'torquebox-no-op'
end

group :development do
  gem 'sinatra-reloader'
end

group :test do
  gem 'rspec'
  gem 'webmock'
end

group :test, :development do
  gem 'pry'
  gem 'torquebox-no-op'
  gem 'vcr'
end

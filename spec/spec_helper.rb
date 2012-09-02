require 'bundler'
Bundler.require :default, :test
ENV['RACK_ENV'] ||= 'test'
require 'sinatra/contrib'

spec_root = File.expand_path(File.dirname(__FILE__))
$: << spec_root
$: << File.expand_path(File.join(File.dirname(__FILE__), '..'))

Sinatra::Base.set :environment, :test
require File.join(File.dirname(__FILE__), '..', 'hoppr_app')
Dir[spec_root+"/support/*"].each {|f| require f}

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

RSpec.configure do |config|
  config.color_enabled = true
  config.include Sinatra::TestHelpers
end

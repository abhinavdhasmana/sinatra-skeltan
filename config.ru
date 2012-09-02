require 'bundler'
Bundler.require
require 'active_support/all'

$: << File.dirname(__FILE__)

use Rack::PostBodyContentTypeParser

ENV['RACK_ENV'] ||= 'development'

require 'hoppr_app'
run HopprApp::App

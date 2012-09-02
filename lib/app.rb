module HopprApp
  class App < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..')
    set :vendor, 'hoppr.ira.hoppr_app_service'
    
    use HopprApp::Controllers::AppUser
  end
end

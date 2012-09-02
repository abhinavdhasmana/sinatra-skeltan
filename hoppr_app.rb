$: << 'lib'
require 'config/environment'

module HopprApp
  Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each do |f|
    autoload File.basename(f, '.rb').camelize.to_sym, f
  end

  module Controllers
    Dir[File.join(File.dirname(__FILE__), 'lib', 'controllers/*.rb')].each do |f|
      autoload File.basename(f, '.rb').camelize.to_sym, f
    end
  end
end

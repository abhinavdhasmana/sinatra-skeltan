require 'erb'

URL               = YAML.load(ERB.new(File.read(File.expand_path(File.join(File.dirname(__FILE__), 'links.yml')))).result)[ENV['RACK_ENV']]


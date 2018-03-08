require 'net_mate'
require File.expand_path('../routes', __FILE__)

Dir["#{File.expand_path('../../app', __FILE__ )}/{controllers,models}/*.rb"].each do |file|
  require file
end

ROOT_PATH = File.expand_path('../../', __FILE__)

class Application < NetMate::Request
end
require 'sinatra'
require 'sinatra/reloader'
require 'socket'

set :environment, :production

get '/' do
  "hello #{Socket.gethostname}"
end

get '/*' do |name|
  "hello #{name}!"
end

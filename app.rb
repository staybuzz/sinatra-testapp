require 'sinatra'
require 'sinatra/reloader'

set :environment, :production

get '/' do
  'hello'
end

get '/*' do |name|
  "hello #{name}!"
end

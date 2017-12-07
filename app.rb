require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'hello'
end

get '/*' do |name|
  "hello #{name}!"
end

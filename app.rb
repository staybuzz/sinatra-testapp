require 'sinatra'
require 'sinatra/reloader'
require 'socket'
require 'sequel'
require 'haml'

helpers do
  include Rack::Utils; alias_method :h, :escape_html
end
set :haml, :escape_html => true
#Sequel::Model.plugin(:schema)

Sequel.connect("sqlite://comments.db")
class Comments < Sequel::Model(:comments)
  def date
    self.posted_date.strftime("%Y-%m-%d %H:%M:%S")
  end

  def formatted_message
    Rack::Utils.escape_html(self.message).gsub(/\n/, "<br>")
  end
end


set :environment, :production

get '/' do
  "hello #{Socket.gethostname}"
end

get '/req' do
  http_headers = request.env.select do |key, val|
    key.start_with?("HTTP_")
  end
  headers = http_headers.inject({}) do |a, (k, v)|
    a[k.sub(/^HTTP_/, "").downcase.gsub(/(^|_)\w/) { |word| word.upcase }.gsub("_", "-") ] = v
    a
  end
  headers.to_a.map { |v| v.join(": ") }.join("\n<br>")
end



get '/blog' do
  @comments = Comments.order_by(:posted_date)
  haml :index
end

post '/blog' do
  Comments.insert(:name=>params[:name], :message=>params['msg'], :posted_date=>Time.now)
  redirect '/blog'
end

get '/*' do |name|
  "hello #{name}!"
end

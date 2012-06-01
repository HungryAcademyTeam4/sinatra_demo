require 'sinatra'
require 'json'
require 'active_record'
require './db/models'

enable :sessions
set :session_secret 'HungryAcademy'

 ActiveRecord::Base.establish_connection(
   :adapter => 'sqlite3',
   :database =>  'db/test.db'
 )


get '/' do
  # 'Hello world!'
  raise session.inspect
end

post '/smith' do
  foo = JSON.parse(request.body.string)
  if foo["taco"]
    "So, you want a #{foo["taco"]} kind of taco, eh?"
  else
    "I need to know what kind of taco you want."
  end
end

post '/messages/create' do
  text = JSON.parse(request.body.string)["text"]
  message = Message.new
  message.update_attribute(:body, text)
end

get '/messages' do
  Message.all.map(&:body).join("<br>")
end

get '/jq' do
  'This is for JQ to prove that she deployed'
end

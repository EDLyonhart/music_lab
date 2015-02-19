require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

# before do
#   @conn = settings.conn
#   Musician.conn = @conn
# end


get '/' do
  redirect '/musicians'
end

get '/musicians' do               #display index
  erb :index
end

get '/musicians/add' do           #display add
  erb :add
end

get '/musicians/:id' do           #display single musician
  erb :show
end

get '/musicians/:id/edit' do      #display edit
  erb :edit
end

post '/musicians/add' do          #create new musician
redirect '/musicians'
end

put '/musicians/:id/edit' do      #edit musician
redirect '/musicians/:id'
end

delete '/musicians/:id' do        #destroy musician
redirect '/musicians'
end
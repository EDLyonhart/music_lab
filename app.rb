require 'sinatra'
require 'sinatra/activerecord'
require './models/musician'

require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/artists'
end

get '/artists' do                                     #display index
  @artits = Artist.all
  erb :"artists/index"
end

get '/artists/new' do                                 #display create
  erb :"artists/new"
end

get '/artists/:id' do                                 #display specific
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

get '/artists/:id/edit' do                            #display edit
  @artist = Artist.find(params[:id])
  erb :"artists/edit"



post '/artists' do                                    #create
  Artist.create({:name => params[:artist_name]})
  redirect '/artists'
end

put '/artists/:id' do                                 #update
  id = params[:id]
  artist = Artist.find(id)
  artist.name = params[':artist_name']
  artist.save
  redirect '/artists/#{id}'
end

delete '/artists/:id' do                              #destroy
  artist = Artist.find(id)
  artist.destroy
  redirect '/artists'
end













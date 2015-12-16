require 'sinatra/base'
require './lib/link'

ENV['RACK_ENV'] ||= 'development'


class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links'
  end

  get '/links/new' do
    erb :index
  end

  post '/links' do
    Link.create(:title => params[:title], :url => params[:url])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

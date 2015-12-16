ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links'
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    filter_tag = Tag.first(name: params[:name])
    @links = filter_tag ? filter_tag.links : []
    erb :links
    #
    # all_links = Link.all
    # bubble_links = all_links.all(:bubble => true)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

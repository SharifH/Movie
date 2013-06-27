require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'open-uri'


get '/' do
	@name = "Sharif Hadidi"
  erb :home
end

get '/search' do
  @query = params[:q]
  url = "http://www.omdbapi.com/?s=#{URI.escape(@query)}&tomatoes=true"
  @results = JSON.load(open(url).read)
  @movies = @results["Search"]
  erb :result
end

get '/movie' do
  url = "http://www.omdbapi.com/?i=#{URI.escape(params[:id])}&tomatoes=true"
  @movieinfo = JSON.load(open(url).read)
  erb :movies
end
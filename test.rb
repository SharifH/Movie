require 'json'
require 'open-uri'

@query = "star wars"

url = "http://www.omdbapi.com/?s=#{URI.escape(@query)}"

@results = JSON.load(open(url).read)

puts @results
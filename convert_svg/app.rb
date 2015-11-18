require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

get '/' do
  erb :"index.html"
end

post '/getsvgs' do
  url = params[:site]
  data = Nokogiri::HTML(open(url))
  svg_elements = data.xpath("//svg")
  output = svg_elements.to_a.map { |i| i.to_s }

  output.to_json
end

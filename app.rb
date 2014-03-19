require 'rubygems'
require 'sinatra'

get '/' do
  @histotweet = Histotweet.new
	erb :index
end

get '/about' do
  @title = 'About the Project'
	erb :about
end

get '/contact' do
  @title = 'Contact'
	erb :contact
end
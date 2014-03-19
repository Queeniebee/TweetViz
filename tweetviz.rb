require 'twitter'
require 'rubygems'
require 'sinatra'
require 'erb'

Twitter.configure do |config|
  config.consumer_key = 'YXBfUhFVph0ezOsOzveeHA'
  config.consumer_secret = 'pQtj4oJEZU1uQfokpGbRX5jvg0rBDPJlvbmCsc'
  config.oauth_token = '51797592-YpLwtQg2NNZrfSKb5al48zKgizOF4gn9mD6oWlgc'
  config.oauth_token_secret = 'NS2wxMEShlj1b6tNx2yv39gM6sIEWHyX7fBObVGyzQ'
end

histotweet = Hash.new(0)
boring_words = ["the", " a", "for", "an", "is", "and", "a",
"so", "in", "at", "be", "it", "on", "to", "of", ":", "are", "as", "-"] 
tweets = Twitter.user_timeline("joasqueeniebee", :count => 200)
tweets.each do |tweet|
	words = tweet.text.downcase.gsub(/@[\w\d]+\s{0,}/, "").split(" ")
	words.each do |word|
 		histotweet.delete_if {|word| boring_words.include?(word)}
 		histotweet[word].nil? ? histotweet[word] = 1: histotweet[word] += 1
	end	
end

histotweet = histotweet.sort_by {|k, v| v}
histotweet.reverse!
histotweet.each do |word, count|
	puts "#{word}: #{count}"
	end
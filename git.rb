require 'nokogiri'
require 'rest-client'
require 'json'
require 'awesome_print'


arr = Array.new
File.open("gh-star-event.json", "r").each_line do |row|
  arr << JSON.parse(row)
end

arr[0..9].collect {|a| puts a["name"]}

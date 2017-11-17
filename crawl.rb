require 'rest-client'
require 'json'

url = "http://webtoon.daum.net/data/pc/webtoon/list_daily_ranking/finished?timeStamp=1510902591279"
result = RestClient.get(url)
result = JSON.parse(result)


result["data"].each do |data|
   #puts data.keys
   artist = data["cartoon"]["artists"].collect {|artist| artist["name"]}
   #puts artist
   title = data["title"]
   #puts title
   score = data["averageScore"].round(1)
   #puts score
   image_url = data["appThumbnailImage"]["url"]
   puts "#{title}(#{artist}) / #{score}점, image: #{image_url}"
end
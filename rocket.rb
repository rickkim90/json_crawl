require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'

File.open("com1.csv", "w") do |file|
  file.write("")
end
DATA.each do |name|
  url = URI.encode "https://www.rocketpunch.com/companies/#{name}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)
  content = text.css('#company-stacks').text
  if content.empty?
    puts "#{name} 없음"
  else
    puts "#{name}"
  end
  puts content
  name = text.css('#company-header .name strong').text
  logo_url = text.css('#company-header > div.content > div > div > img').text
  describe = text.css('#company-overview').text

  result = Array.new
  result << name
  result << logo_url
  result << describe
  result << url

  content.split("\n").each do |line|
    l = line.strip
    if l.length > 0
      #l = "AAA"
      result << l
    end
  end
  File.open("company.csv", "a") do |file|
    file.write(result.join(","))
    file.write("\n")
  end

end

__END__
eggbuneducation

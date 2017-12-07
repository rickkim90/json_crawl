require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'

DATA.each do |name|
  url = URI.encode "https://www.rocketpunch.com/companies/#{name}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)
  a = text.css('#company-stacks').text
  if a.empty?
    puts "#{name} 없음"
  else
    puts "#{name}"
  end
  puts a
end

__END__
vitruv
fastcampus
eggbuneducation
classting
smatoos
bravepopscompany
forwardfuture
chinada
riiid_inc
yeastudio
imcompany
knowre
codigm
qualson
stcompany
speakcare
lablup
incombine

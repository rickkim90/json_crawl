# 4차산업혁명 선도인재 양성 프로젝트 과정

---
## 1. Week 1 Day 10 

***



rails new [프로젝트명]

rails g controller msg new send



cd ~ -> 홈폴더

cd / -> root

ls -al 모든파일(숨겨놓은 파일 포함)

vi .bashrc

alias rs='rails s -b 0.0.0.0'

source .bashrc 적용



cd /vagrant

cd 프로젝트이름



1. /msg/new에서 메세지를 받아

   ```ruby
   <%= form_tag(msg_send_path) do %>
   내용 : <%= text_area_tag(:content)%><br>
   <%= submit_tag("전송")%>
   <% end %>		
   ```

2. /msg/send



#### ruby sleep

1초마다

```ruby
msg = "hi"
while true
	sleep(1)
	RestClient.get(URI.encode("https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{chat_id}&text=#{msg}"))
end
```



##### Cron linux



##### gem whenever

+ https://github.com/javan/whenever

생성한 폴더에서 wheneverize. 

mkdir config

Rakefile 생성저장

```ruby
namespace :telegram do
  task :hello do
    puts "hello!!!"
  end
end
```

rake "telegram:hello"

rake : task batch파일



```ruby
namespace :db do
  task :migrate do
    puts "rake db:migrate가 실행되었습니다."
  end
end
```

https://bluesh55.github.io/2016/10/23/rake-task/



##### AWS secret key 환경변수 시

gem figaro

echo $IP == puts ENV[IP]

ruby environment variable



cd ~

vi .bashrc

export MY_SECRET_KEY=01077349505

source .bashrc



rails new [폴더명] --skip-bundle

rails g scaffold post title content

rake db:migrate

root 'posts#index'

rs = server 시작



#### server upload

carrierwave

https://github.com/carrierwaveuploader/carrierwave

```ruby
gem 'carrierwave', '~> 1.0'
```



post.rb

```ruby
mount_uploader :photo, PhotoUploader	
```



render 된 _form.erb

파일첨부는 file_filed로 변경

```ruby
  <div class="field">
    <%= f.label :photo %><br>
    <%= f.file_field :photo %>
  </div>
```



post.controller.rb

permit에 :photo 추가



show.erb에는 img 태그로 덮어준다

```ruby
<p>
  <strong>Photo:</strong>
  <img src="<%= @post.photo %>">
</p>
```



## 중요(uploader는 겹치면 안된다, 혹은 column을 바꾸면 가능하다)

```ruby
rails generate uploader 이름
```



### Crawling

JSON crwaling 할때

gem 'rest-client'



```ruby
result = JSON.parse(result)
```



hash로 우선 변경

keys

해쉬 배열 해쉬 배열



collect method



```ruby
class Crawler
  def self.html(url, action. params)
    Nokogiri::HTML(sned_request(Action, url, params))
  end
  
  def self.json(url, action. params)
  JSON.parse(sned_request(Action, url, params))
  end
  
  private  
  def self.send_request
  RestClient.send(Action, url, params)
  end
end
```



##### Session

무상태성을 뛰어넘기 위해 Session(cookie)을 사용

직접 없애거나 세팅을 바꾸기 전까지 남아있음



Network 탭에서 
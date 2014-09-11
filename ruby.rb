require 'rubygems'
require 'instagram'
require 'pry'

Instagram.configure do |config| 
	config.client_id = '3922bdd70c0343b39e5133fb03132cae'
	config.client_secret = '883f672e2b2044aba02eb16521ecf243'
end

usernames = File.open('input.txt').read

usernames.each_line do |user|
  begin 
  	user.gsub!(/\n/,"")
  	users = Instagram.user_search(user)
	user = users[0]
    text = "#{user.username}, #{user.id}"
    text.delete!("\n")
    File.open('output.txt', 'a') { |file| file.puts text }
    sleep 0.5
  rescue
  end
end

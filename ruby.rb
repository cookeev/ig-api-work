require 'rubygems'
require 'instagram'

Instagram.configure do |config| 
	config.client_id = ''
	config.client_secret = ''
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

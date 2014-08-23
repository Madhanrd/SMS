require 'rubygems'
require 'twilio-ruby'
 
account_sid = "HIDDEN_SECRET"
auth_token = "HIDDEN_SECRET"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+15412272133" # Your Twilio number
 
friends = {
"+15416210655" => "Ian"
}

message = [
  "eat healthy snacks.",
  "put down the donut and think smart.",
  "work out tonight.",
  "love yourself and be good to your body.",
  "you are what you eat. So don't eat crap."
]

text = message[rand(message.length)]

friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, #{text}"
  ) 
  puts "Sent message to #{value}"
end

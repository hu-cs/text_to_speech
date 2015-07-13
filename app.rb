require 'rubygems'
require 'sinatra'
require 'tts' # https://github.com/c2h2/tts

get '/' do
  erb :index
end


post '/download' do
 puts "say it!"
 text = params[:text].tr("`", "")
 puts text
 text.to_file "en"

 if text.length >= 21
 	puts "if part"
 	filename = text[0..20]
 else
 	"puts else part.. "
 	filename = text
 end

 puts "length: #{text.length}"
 `mv '#{filename}.mp3' public/mp3/voice.mp3`

 redirect '/mp3/voice.mp3'
end

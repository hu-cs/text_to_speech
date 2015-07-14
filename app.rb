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
 text.to_file params[:lang]

 if text.length >= 21
 	filename = text[0..20]
 else
 	filename = text
 end

 time = Time.now.strftime("%Y-%d-%m")
 time_toi = Time.now.to_i
 #  create directory if not exist
 if !File.exist? time
 	puts "create the dir"
 	FileUtils.mkdir_p('public/mp3/'+time)
 end

 puts "length: #{text.length}"
 `mv '#{filename}.mp3' public/mp3/#{time}/#{time_toi}.mp3`

 # redirect 'mp3/voice.mp3'
 redirect File.join('mp3', time+"/#{time_toi}.mp3")
end

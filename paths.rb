require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

def set_up_files
  @files = Dir.children("./public")
  @files.select! do |file|
    file.include?(".")
  end
  @files.sort!
end

get "/" do
  set_up_files

  if params[:reverse] == "true"
    @files.sort!.reverse!
    @path = "./"
    @button_text = "Sort ascending"
  else
    @files.sort!
    @path = "./?reverse=true"
    @button_text = "Sort descending"
  end

  erb :index
end


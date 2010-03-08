require 'sinatra'
require 'haml'
require 'sass'
require 'fileutils'
require 'faker'

begin
  require 'rdiscount'
  # ^^ that sets a Markdown constant
rescue LoadError
  require 'bluecloth'
  Markdown = BlueCloth
end

# Core Sinatra application to run mercury apps
class Mercury < Sinatra::Application
  SASS = 'sass'
  JS = 'js'
  MARKDOWN = 'md'
  
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'
  
  before do
    @view_file_request = params["splat"][0]  
  end
  
  get '/*.gif' do
    content_type "image/gif"
    stream_image(@view_file_request)
  end

  get '/*.png' do
    content_type "image/png"
    stream_image(@view_file_request)
  end

  get '/*.jpg' do
    content_type "image/jpg"
    stream_image(@view_file_request)
  end

  get '/*.jpeg' do
    content_type "image/jpeg"
    stream_image(@view_file_request)
  end
  
  get '/*' do
    haml view_file_request.empty? ? view_file = get_view('index.haml') : view_file_request.to_sym, :layout => get_view('layout.haml')
  end

  def sass(sassfile)
    ["<style type='text/css'>",
      Sass::Engine.new(open_file(find_file(sassfile, SASS))).render, 
      "</style>\n"].join("\n")
  end
  
  def javascript(jsfile)
    ["<script type='text/javascript'>", 
      open_file(find_file(jsfile, JS)), 
      "</script>\n"].join("\n")
  end
  
  def markdown(mdfile)
    Markdown.new(open_file(find_file(mdfile, MARKDOWN))).to_html
  end
  
  
private  
  def find_file(filename, ext)
    Dir.glob(File.join(options.views, "**/*.#{ext}")).select { |extfile| extfile =~ /#{filename}.#{ext}$/ }.first
  end
  
  def open_file(full_path_and_filename)
    open(full_path_and_filename,'r').read  
  end
    
  def get_view(filename)
    view_directory = File.join(File.dirname(__FILE__),'views')
    open_file File.join(view_directory,filename) 
  end
  
  def stream_image(filename)
    open(File.join(options.views, filename), 'rb').read
  end
  
  
    
end

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

  get '/*' do
    view_file_request = params["splat"][0]
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
    if File.exists?(File.join(options.views, filename))
      open_file File.join(options.views,filename) 
    else
      view_directory = File.join(File.dirname(__FILE__),'views')
      open_file File.join(view_directory,filename) 
    end
  end
  
    
end

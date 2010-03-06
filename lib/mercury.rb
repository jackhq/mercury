require 'sinatra'
require 'haml'
require 'sass'
require 'fileutils'
require 'faker'

# Core Sinatra application to run mercury apps
class Mercury < Sinatra::Application
  SASS = 'sass'
  JS = 'js'
  
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    view_file_request = params["splat"][0]
    haml view_file_request.empty? ? view_file = get_view('index.haml') : view_file_request.to_sym, :layout => get_view('layout.haml')
  end

  def sass(sassfile)
    ["<style type='text/css'>",
      Sass::Engine.new(open(find_file(sassfile, SASS), 'r').read).render, 
      "</style>\n"].join("\n")
  end
  
  def javascript(jsfile)
    ["<script type='text/javascript'>", 
      open(find_file(jsfile, JS), 'r').read, 
      "</script>\n"].join("\n")
  end
  
private  
  def find_file(filename, ext)
    Dir.glob(File.join(options.views, "**/*.#{ext}")).select { |extfile| extfile =~ /#{filename}.#{ext}$/ }.first
  end
    
  def get_view(filename)
    view_directory = File.join(File.dirname(__FILE__),'views')
    open(File.join(view_directory,filename),'r').read
  end
  
    
end

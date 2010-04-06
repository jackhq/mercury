require 'sinatra'
require 'haml'
require 'fileutils'
require 'faker'
require File.dirname(__FILE__) + '/mercury/helpers'
require File.dirname(__FILE__) + '/mercury/images'
require 'coffee_script'


# Core Sinatra application to run mercury apps
class Mercury < Sinatra::Application
  helpers Sinatra::MercuryHelpers
  register Sinatra::MercuryImages
  
  
  
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'
  set :views, FileUtils.pwd.gsub("\n",'') + '/wwwroot'
  
  get '/*' do
    view_file_request = params["splat"][0]  
    haml view_file_request.empty? ? view_file = get_view('index.haml') : view_file_request.to_sym, :layout => get_view('layout.haml')
  end

  
private  
    
  def get_view(filename)
    full_file = File.join(options.views, filename)
    if File.exists?(full_file)
      view_file = full_file 
    else
      view_directory = File.join(File.dirname(__FILE__),'views')
      view_file = File.join(view_directory,filename)
    end
    open(view_file,'r') { |file| file.read }
  end  
end

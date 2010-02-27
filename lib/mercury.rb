require 'sinatra'
require 'haml'
require 'fileutils'

class Mercury < Sinatra::Default
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    unless params["splat"][0].empty?
      haml params["splat"][0].to_sym, :layout => open(File.dirname(__FILE__) + '/views/layout.haml','r').read
    else
      haml open(File.dirname(__FILE__) + '/views/index.haml','r').read, :layout => open(File.dirname(__FILE__) + '/views/layout.haml','r').read
    end
  end

end

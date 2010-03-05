require 'sinatra'
require 'haml'
require 'sass'
require 'fileutils'
require 'faker'

class Mercury < Sinatra::Application
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    unless params["splat"][0].empty?
      haml params["splat"][0].to_sym, :layout => open(File.dirname(__FILE__) + '/views/layout.haml','r').read
    else
      haml open(File.dirname(__FILE__) + '/views/index.haml','r').read, :layout => open(File.dirname(__FILE__) + '/views/layout.haml','r').read
    end
  end

  def sass(sassfile)
    "<style type='text/css'>\n" + Sass::Engine.new(open(options.views + sassfile, 'r').read).render + "\n</style>\n"
  end
  
  def javascript(jsfile)
    "<script type='text/javascript'>\n" + open(options.views + jsfile, 'r').read + "\n</script>\n"
  end
  
  
end

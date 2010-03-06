require 'sinatra'
require 'haml'
require 'sass'
require 'fileutils'
require 'faker'

class Mercury < Sinatra::Application
  SASS = 'sass'
  JS = 'js'
  
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    vf = params["splat"][0]
    vd = File.join(File.dirname(__FILE__),'views')
    layout_template = open(File.join(vd,'layout.haml'),'r').read

    view_file = vf.empty? ? open(File.join(vd,'index.haml'),'r').read : vf.to_sym

    haml view_file, :layout => layout_template
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
  
end

require 'sinatra'
require 'haml'
require 'sass'
require 'fileutils'
require 'faker'

class Mercury < Sinatra::Application
  set :root,  FileUtils.pwd.gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    layout_template = open(File.dirname(__FILE__) + '/views/layout.haml','r').read
    view_file = params["splat"][0].empty? ? params["splat"][0].to_sym : open(File.dirname(__FILE__) + '/views/index.haml','r').read
    haml view_file, :layout => layout_template
  end

  def sass(sassfile)
    ["<style type='text/css'>",
      Sass::Engine.new(open(find_file(sassfile, '.sass'), 'r').read).render, 
      "</style>\n"].join("\n")
  end
  
  def javascript(jsfile)
    ["<script type='text/javascript'>", 
      open(find_file(jsfile,'js'), 'r').read, 
      "</script>\n"].join("\n")
  end
  
private  
  def find_file(filename, ext)
    Dir.glob(File.join(options.view, "**/*.#{ext}")).select { |f| f =~ /#{filename}.#{ext}$/ }.first
  end
  
  
  
end

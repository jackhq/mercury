require 'sinatra/base'
require 'sass'

begin
  require 'rdiscount'
  # ^^ that sets a Markdown constant
rescue LoadError
  require 'bluecloth'
  Markdown = BlueCloth
end

module Sinatra
  module MercuryHelpers

    SASS = 'sass'
    JS = 'js'
    MDOWN = 'md'
    COFFEE = 'coffee'
    CSS = 'css'
    SCSS = 'scss'
    RUBY = 'rb'
    
    def ruby(rubyfile)
      instance_eval(open_file(find_file(rubyfile, RUBY)))
    end
    

    def css(cssfile)
      render_script open_file(find_file(cssfile, CSS)), 'css'    
    end

    def sass(sassfile, mediatype)
      if mediatype.nil? then mediatype = "all" end
      ["<style type='text/css' media='#{mediatype}' >",
        Sass::Engine.new(open_file(find_file(sassfile, SASS))).render, 
        "</style>\n"].join("\n")
    end

    def scss(scssfile)
      ["<style type='text/css'>",
        Sass::Engine.new(open_file(find_file(scssfile, SCSS)), :syntax => :scss).render, 
        "</style>\n"].join("\n")
    end

    def javascript(jsfile)
      render_script open_file(find_file(jsfile, JS)), 'javascript'
    end

    def markdown(mdfile)
      Markdown.new(open_file(find_file(mdfile, MDOWN))).to_html
    end

    def coffee(coffeefile)
      render_script open_file(find_file(coffeefile, COFFEE)), 'coffeescript'
    end

  #private
  
    def render_script(text, file_type)
      ["<script type='text/#{file_type}'>",
        text,
        "</script>\n"].join("\n")      
    end
    
  
    def find_file(filename, ext)
      Dir.glob(File.join(options.views, "**/*.#{ext}")).select { |extfile| extfile.downcase =~ /\/#{filename.to_s.downcase}.#{ext}$/ }.first
    end
  
    def open_file(full_path_and_filename)
      open(full_path_and_filename,'r') { |file| file.read }  
    end
  
  end
  
  helpers MercuryHelpers
end

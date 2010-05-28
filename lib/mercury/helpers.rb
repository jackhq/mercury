require 'sinatra/base'
require 'sass'
require 'maruku'

module Sinatra
  module MercuryHelpers

    SASS = 'sass'
    JS = 'js'
    MDOWN = 'md'
    COFFEE = 'coffee'
    CSS = 'css'
    SCSS = 'scss'
    RUBY = 'rb'
    
    # parses and evals ruby partials
    def ruby(rubyfile)
      instance_eval(open_file(find_file(rubyfile, RUBY)))
    end
    
    # renders css files
    def css(cssfile, mediatype="all")
      render_style open_file(find_file(cssfile, CSS)), mediatype
    end

    # renders sass files
    def sass(sassfile, mediatype="all")
      render_style Sass::Engine.new(open_file(find_file(sassfile, SASS))).render, mediatype
    end

    # renders scss files
    def scss(scssfile, mediatype="all")
      render_style Sass::Engine.new(open_file(find_file(scssfile, SCSS)), :syntax => :scss).render, mediatype
    end
    
    # renders javascript files
    def javascript(jsfile)
      render_script open_file(find_file(jsfile, JS)), 'javascript'
    end

    # renders markdown files
    def markdown(mdfile)
      Maruku.new(open_file(find_file(mdfile, MDOWN))).to_html
    end

    # renders coffee files
    def coffee(coffeefile)
      render_script open_file(find_file(coffeefile, COFFEE)), 'coffeescript'
    end

  #private
  
    # renders script tag based on file type
    def render_script(text, file_type)
      ["<script type='text/#{file_type}'>",
        text,
        "</script>\n"].join("\n")      
    end
    
    # renders style tag based on media type
    def render_style(text, mediatype="all")
      ["<style type='text/css' media='#{mediatype}' >",
        text,
        "</style>\n"].join("\n")      
    end
    
    
    # finds file
    def find_file(filename, ext)
      Dir.glob(File.join(options.views, "**/*.#{ext}")).select { |extfile| extfile.downcase =~ /\/#{filename.to_s.downcase}.#{ext}$/ }.first
    end
  
    def open_file(full_path_and_filename)
      open(full_path_and_filename,'r') { |file| file.read }  
    end
  
  end
  
  helpers MercuryHelpers
end

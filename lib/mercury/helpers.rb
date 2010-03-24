require 'sinatra/base'
require 'sass'
require 'redcloth'

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
    MARKDOWN = 'md'
    TEXTILE = 'textile'
    COFFEE = 'coffee'

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

    def textile(txfile)
      RedCloth.new(open_file(find_file(txfile, TEXTILE))).to_html
    end

    def coffee(coffeefile)
      ["<script type='text/coffeescript'>",
        open_file(find_file(coffeefile, COFFEE)),
        "</script>\n"].join("\n")
    end

  private
  
    def find_file(filename, ext)
      Dir.glob(File.join(options.views, "**/*.#{ext}")).select { |extfile| extfile.downcase =~ /\/#{filename.to_s.downcase}.#{ext}$/ }.first
    end
  
    def open_file(full_path_and_filename)
      open(full_path_and_filename,'r') { |file| file.read }  
    end
  
  end
  
  helpers MercuryHelpers
end

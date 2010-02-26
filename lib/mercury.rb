require 'sinatra'
require 'haml'

class Mercury < Sinatra::Default
  set :root,  %x["pwd"].gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    unless params["splat"][0].empty?
      haml params["splat"][0].to_sym, :layout => @layout
    else
      haml @index, :layout => @layout
    end
  end

end


__END__

@@layout
!!!
%html{ :xmlns => "http://www.w3.org/1999/xhtml", :lang => "en", 'xml:lang' => "en" }
  %head
    %title Mercury
    - ['reset','text','960','app'].each do |css|
      %link{ :href => "/stylesheets/#{css}.css", :rel => "stylesheet", :type => "text/css", :media => "screen", :charset => "utf-8" }
  %body
    #header
      .container_12
        %small{:style => 'font-style:italic;float:right;'} WireFrame Tool
        %h1{:style => 'margin:0;padding:0;'}
          %a{:href => '/', :style => 'color:white;text-decoration:none;'} Mercury

    #wrap
      .container_16
        = yield
    .clear
    #footer
      .container_12
        .grid_4.prefix_8
          %p Jack Russell Software Company, LLC

    - ['jquery-1.4.2.min'].each do |js|
      %script{:src => "/javascripts/#{js}.js", :type => 'text/javascript'}
  
  

@@index
.grid_16
  %p Welcome

  %ul
  - Dir.glob('views/**/*.haml').each do |f|
    - unless f =~ /index/ or f =~ /layout/
      %li
        %a{:href => f.gsub(/views/,'').match(/(.*).haml$/)[1]}= f.match(/\/(.*).haml$/)[1]
  



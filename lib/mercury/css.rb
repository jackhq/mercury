module Sinatra
  module MercuryCss
    # register app
    def self.registered(app)
      # stream images
      app.get %r{(.css)$} do
        content_type 'text/css'
        if File.file?(options.views + request.path_info.sub(/\.css$/,'.sass'))
          sass_file = options.views + request.path_info.sub(/\.css$/,'.sass')
          Sass::Engine.new(open_file(sass_file)).render
        else
          open_file(options.views + request.path_info)
        end
      end
    end        
  end
  register MercuryCss
end

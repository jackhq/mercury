module Sinatra
  module MercuryJs
    # register app
    def self.registered(app)
      # stream images
      app.get %r{(.js)$} do
        content_type 'text/javascript'
        if File.file?(options.views + request.path_info.sub(/\.js$/,'.coffee'))
          coffee_file = options.views + request.path_info.sub(/\.js$/,'.coffee')
          brew(coffee_file)
        else
          open_file(options.views + request.path_info)
        end
      end
    end        
  end
  register MercuryJs
end

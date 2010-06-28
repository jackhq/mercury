module Sinatra
  module MercuryCss
    # register app
    def self.registered(app)
      # stream images
      app.get %r{(.css)$} do
        content_type 'text/css'
        File.open(options.views + request.path_info, 'rb') do |file| 
          file.read
        end 
      end
    end        
  end
  register MercuryCss
end

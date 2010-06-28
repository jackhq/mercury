module Sinatra
  module MercuryJs
    # register app
    def self.registered(app)
      # stream images
      app.get %r{(.js)$} do
        content_type 'text/javascript'
        File.open(options.views + request.path_info, 'rb') do |file| 
          file.read
        end 
      end
    end        
  end
  register MercuryJs
end

module Sinatra
  module MercuryImages
    def self.registered(app)
      # stream images
      app.get %r{(gif|jpg|png|jpeg)$} do
        content_type get_image_type(request.path_info)
        File.open(options.views + request.path_info, 'rb') do |file| 
          file.read
        end 
      end
    end
    
    def get_image_type(image_name)
      if image_name =~ /.gif/
        "image/gif"
      elsif image_name =~ /.jpg/
        "image/jpg"
      elsif image_name =~ /.png/
        "image/png"
      elsif image_name =~ /.jpeg/
        "image/jpeg"
      end
    end
        
  end
  register MercuryImages
end

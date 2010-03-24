module Sinatra
  module Images
    def self.registered(app)
      app.get '/*.gif' do
        stream_image([params["splat"][0],'gif'].join('.'),"image/gif")    
      end

      app.get '/*.png' do
        stream_image([params["splat"][0],'png'].join('.'),"image/png")
      end

      app.get '/*.jpg' do
        stream_image([params["splat"][0],'jpg'].join('.'),"image/jpg")
      end

      app.get '/*.jpeg' do
        stream_image([params["splat"][0],'jpeg'].join('.'),"image/jpeg")
      end
    end
    
  private
    def get_image(filename)
      open(File.join(options.views, filename), 'rb') { |file| file.read }    
    end

    def stream_image(filename, ct)
      content_type(ct)    
      get_image(filename)
    end
    
  end
  register Images
end

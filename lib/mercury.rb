require 'sinatra'
require 'haml'

class Mercury < Sinatra::Default
  set :root,  %x["pwd"].gsub("\n",'')
  set :public, File.dirname(__FILE__) + '/public'

  get '/*' do
    unless params["splat"][0].empty?
      haml params["splat"][0].to_sym
    else
      haml :index
    end
  end

end
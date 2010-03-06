require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "mercury index" do
  include Rack::Test::Methods

  def app
    Mercury
  end
  
  it "should be true" do
    get '/'
    last_response.should be_true
  end
  
  it "should contain mercury" do
    get '/'
    last_response.body.should =~ /Mercury/
  end

  it "should contain mercury" do
    get '/'
    last_response.body.should =~ /Jack Russell Software/
  end
  
  # it "should return error" do
  #   app.stub!(:haml).and_return("<h1>test</h1>")
  #   get '/test'
  #   puts last_response.body
  # end
  
  
end

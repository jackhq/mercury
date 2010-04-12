require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe "images" do

  include Rack::Test::Methods

  def app
    Mercury
  end

  it "should return gif" do
    File.stub!(:open).and_return('foobar')
    get "/hello.gif"
    last_response.body.should == 'foobar'
  end
  
  it "should return correct file content type for gif" do
    app.get_image_type('/hello.gif').should == "image/gif"
  end

  it "should return correct file content type for jpg" do
    app.get_image_type('/hello.jpg').should == "image/jpg"
  end

  it "should return correct file content type for png" do
    app.get_image_type('/hello.png').should == "image/png"
  end

  it "should return correct file content type for jpeg" do
    app.get_image_type('/hello.jpeg').should == "image/jpeg"
  end
  
end
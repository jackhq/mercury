require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe "helpers" do

  include Rack::Test::Methods

  def app
    Mercury
  end
  
  before(:all) do
    app.extend(Sinatra::MercuryHelpers)
  end
  
  
  it "should return js file" do
    app.render_script("Hello World", "javascript").should == "<script type='text/javascript'>\nHello World\n</script>\n"
  end

  it "should return style for all media" do
    app.render_style("Hello World").should == "<style type='text/css' media='all' >\nHello World\n</style>\n"    
  end
  

end
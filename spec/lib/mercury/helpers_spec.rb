require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe "helpers" do

  include Rack::Test::Methods

  def app
    Mercury
  end
  
  it "should return js file" do
    puts app.render_script("test", "javascript")
    #app.css(:hello).should =~ /^<script(.*)<\/script>$/
  end


end
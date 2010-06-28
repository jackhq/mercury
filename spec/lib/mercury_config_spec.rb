require File.expand_path(File.dirname(__FILE__) + '/../../lib/mercury_config')

describe "mercury config" do
  it "should default to a jquery stack with project name of sample" do
    config = MercuryConfig.new(['sample'])
    config.stack.should == MercuryConfig::JQUERY
    config.project.should == "sample"
  end
  
  it "should equal sencha if specified" do
    config = MercuryConfig.new(['stack:sencha','sample'])
    config.stack.should == MercuryConfig::SENCHA
    config.project.should == "sample"
    
  end
  
  it "should equal jquery if specified and does not match any stack" do
    config = MercuryConfig.new(['stack:mystack','sample'])
    config.stack.should == MercuryConfig::JQUERY
    config.project.should == "sample"
    
  end
  
  
end

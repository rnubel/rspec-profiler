require 'spec_helper'

describe "profiling" do
  it "works" do
    1.should == 1
  end

  it "is slower" do
    sleep(0.1)
    1.should == 1
  end
end

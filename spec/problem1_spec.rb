require './problem1.rb'

describe Problem1 do

    it "should return [] for an empty array" do
        Problem1.something_unusual([]).should == "[]"
    end

    it "should work for a single value" do
        Problem1.something_unusual(["a"]).should == "[a]"
    end

    it "should work for a couple of values" do
        Problem1.something_unusual([1, 2, 3]).should == "[1, 2, 3]"
    end

end
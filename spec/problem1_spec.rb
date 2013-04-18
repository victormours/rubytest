require './problem1.rb'

describe Problem1 do
    before do @p = Problem1.new end

    it "should return [] for an empty array" do
        @p.something_unusual([]).should == "[]"
    end

    it "should work for a single value" do
        @p.something_unusual(["a"]).should == "[a]"
    end

    it "should work for a couple of values" do
        @p.something_unusual([1, 2, 3]).should == "[1, 2, 3]"
    end

end
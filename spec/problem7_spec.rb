#Creating tests for this problem may look like a lot of overhead, especially since the problem is about simplifying code,
#however, it was asked to refactor the code, and refactoring means testing for non-regression.
#These tests revealed the original code was not working properly in case of a time out, and make sure that
#error handling is done properly in this case.


require './problem7.rb'

describe Problem7 do

    context ", when nothing times out," do
        before do
            @p = Problem7Tester.new(1, 1, 1)
            @p.do_actions
        end

        it "should have the correct logger info" do
            expect(@p.info_log).to eq("About to do action1About to do action2About to do action3")
        end

        it "should have no errors in the log" do
            expect(@p.error_log).to eq("")
        end

        it "should have performed all actions" do
            expect(@p.has_performed[:action1]).to eq(true)
            expect(@p.has_performed[:action2]).to eq(true)
            expect(@p.has_performed[:action3]).to eq(true)
        end
    end


    context ", when the second action times out," do
        before do
            @p = Problem7Tester.new(1, 11, 1)
            @p.do_actions
        end

        it "should have the correct logger info" do
            expect(@p.info_log).to eq("About to do action1About to do action2About to do action3")
        end

        it "should have an in the log" do
            expect(@p.error_log).to eq("Got error: execution expired")
        end

        it "should have performed actions 1 and 3 but not action 2" do
            expect(@p.has_performed[:action1]).to eq(true)
            expect(@p.has_performed[:action2]).to eq(false)
            expect(@p.has_performed[:action3]).to eq(true)
        end
    end

end
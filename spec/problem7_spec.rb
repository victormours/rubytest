require './problem7.rb'

describe Problem7 do

    before do
        @p = Problem7.new
        @p.do_actions
    end

    it "should have the correct logger info" do
        expect(@p.info_log).to eq("About to do action1About to do action2About to do action3")
    end

    it "should have no errors in the log" do
        expect(@p.error_log).to eq("")
    end

    it "should have performed all actions" do
        expect(@p.all_actions_performed?).to eq(true)
    end


end
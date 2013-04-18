require "./problem2.rb"
require "action_controller"
require "active_record"

class CreateTables < ActiveRecord::Migration
  def change
    create_table :cars do |t|
        t.string :name
        t.integer :user_id
    end

    create_table :components do |t|
        t.string :componenttype
        t.boolean :functioning
        t.integer :car_id
    end
  end
end

describe Car do
    before do
        ActiveRecord::Base.establish_connection(adapter:"sqlite3", database:"problem2.sqlite3")
        CreateTables.new.migrate :change

        @car = Car.new
        4.times do
            @car.components.build(componenttype: "wheel", functioning: true).save!
        end
    end


    it "breaking one wheel should work" do
        @car.break_random_wheel!.should be_true
    end

    it "breaking all wheels should work" do
        4.times do @car.break_random_wheel!.should be_true end
    end

    it "breaking the fifth wheel should not work" do
        4.times do @car.break_random_wheel!end
        @car.break_random_wheel!.should be_false
    end

    after do
        File.delete("problem2.sqlite3")
    end
end

describe CarSimulationController do

end
require "./problem2.rb"
require "action_controller"
require "active_record"

class CreateTables < ActiveRecord::Migration
  def change
    create_table :cars do |t|
        t.string :name
        t.integer :user_id
    end
  end
end



describe Car do
    before do
        ActiveRecord::Base.establish_connection(adapter:"sqlite3", database:"problem2.sqlite3")
        CreateTables.new.migrate :change

        @car = Car.new
    end

    subject { @car }

    it { should respond_to(:components) }

    after do
        File.delete("problem2.sqlite3")
    end
end

describe CarSimulationController do

end
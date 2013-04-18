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
    before { @car = Car.new }

    subject { @car }

    it { should respond_to(:components) }
end

describe CarSimulationController do

end
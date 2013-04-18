
#Issues with the original code:

#The original code is vulnerable to SQL injection because it builds a SQL query from unvalidated user input.
#Using a query with question marks is safer thanks to Rails' built-in filter for special SQL characters.

#The original controller contains logic that has nothing to do with the response.
#Such business logic should be handled by the model ("Fat Model, Skinny Controller").

#The original method does not take into account the possibility that one or many wheels may already be broken,
#or assumes that a wheel can be broken multiple times. Depending on the domain, this assumption may make sense
#but I assumed that we are only interested in breaking functioning wheels

#The original method decrements the attribute functioning_wheels after a wheel breaks.
#Having such an attribute replicates information, since we could just determine its value through a database query,
#however, we can assume that for optimization purposes, we need to use such an attribute.
#In this case, we should add some validation to make sure the number of functioning wheels is always the right one
#when saving the car.

require "action_controller"
require "active_record"

class CarSimulationController < ActionController::Base
 def break_random_wheel
   @car = Car.where("name = ? and user= ? ", params[:name], params[:user_id])
   @car.break_random_wheel!
   @car.save

 end
end

class Car < ActiveRecord::Base
    has_many :components

    def break_random_wheel!
        @wheels = components.where(type: 'wheel', functioning: false)
        if @wheels.any?
            random_wheel = (rand*@wheels.count).round
            @wheels[random_wheel].break!
            @car.functioning_wheels -= 1
        end

    end

end

class Component < ActiveRecord::Base
    belongs_to :car

end

class User < ActiveRecord::Base
end
#Main issues with the original code:

#The original code is vulnerable to SQL injection because it builds a SQL query from unvalidated user input.
#Using a query with question marks is safer thanks to Rails' built-in filter for special SQL characters.

#The original controller contains logic that has nothing to do with the response.
#Such business logic should be handled by the model ("Fat Model, Skinny Controller").

#Components apparently have an attribute named "type", which is a reserved name.
#I renamed it "componenttype".

#Minor Issues

#The original method does not take into account the possibility that one or many wheels may already be broken,
#or assumes that a wheel can be broken multiple times. Depending on the domain, this assumption may make sense
#but I assumed that we are only interested in breaking functioning wheels

#We should use floor instead of round to randomly pick a wheel.

#The original method decrements the attribute functioning_wheels after a wheel breaks.
#Having such an attribute replicates information, since we could just determine its value through a database query,
#however, we can assume that for optimization purposes, we need to use such an attribute because we are going to write and read
#this attribute more often than we are going to save to the database
#In this case, we should add some validation to make sure the number of functioning wheels is always the right one
#when saving the car. And also add a bunch of callbacks to make it consistent.
#For the scope of this test, all of this is probably premature optimization. Let's give up on this attribute.

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

    #returns false if all wheels are already broken
    def break_random_wheel!
        @wheels = components.where(componenttype: 'wheel', functioning: true)
        if @wheels.any?
            random_wheel = (rand*@wheels.count).floor
            @wheels[random_wheel].break!
        end
        return @wheels.any?
    end
end

class Component < ActiveRecord::Base
    belongs_to :car

    def break!
      update_attributes(functioning: false)
    end
end

class User < ActiveRecord::Base
end
#This is a design pattern problem, and the solution in the strategy pattern.

#I'm assuming that we still want to be able to feed pets with some unconventional food
#but that we want an easy and more elegant way of deciding which is the best type of food.

#The heavy-handed way of implementing strategy would be with a FeedStrategy and three subclasses, maybe an abstract factory.
#But let's keep it simple: giving each pet a favorite food is probably the easiest solution.

class Pet
    def feed(food)
        puts "thanks!"
    end
end

class Cat < Pet
    def favorite_food
        :milk
    end
end

class Dog < Pet
    def favorite_food
        :dogfood
    end
end

class Cow < Pet
    def favorite_food
        :grass
    end
end

cat = Cat.new
dog = Dog.new
cow = Cow.new
my_pets = [cat, dog, cow, ]

my_pets.each do |pet|
    pet.feed pet.favorite_food
end

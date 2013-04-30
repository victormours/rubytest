#This is a design pattern problem, and the solution in the strategy pattern.

#I'm assuming that we still want to be able to feed pets with some unconventional food
#but that we want an easy and more elegant way of deciding which is the best type of food.

#Giving the food argument a default value avoids feature envy

class Pet
    def feed(food)
        puts "thanks!"
    end
end

class Cat < Pet
    def feed(food = :milk)
        super
    end
end

class Dog < Pet
    def feed(food = :dogfood)
        super
    end
end

class Cow < Pet
    def feed(food = :grass)
        super
    end
end

cat = Cat.new
dog = Dog.new
cow = Cow.new
my_pets = [cat, dog, cow, ]

my_pets.each do |pet|
    pet.feed
end

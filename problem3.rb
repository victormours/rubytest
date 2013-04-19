#3a The controller and the model are going to be stuck in an infinite loop, which is going to open a bunch of connections
#and then, bad stuff is going to happen.

#Bonus bug: Car.first is going to return nil if there are no cars in the database, and the next line will trigger a NoMethodError

#3b The method sleep will only affect the current request
#(except on a single-threaded server such as Webrick, but that's probably not what you're using in production)
#therefore, each user will only have to wait for their own action to complete.
#x waits 30 seconds
#y waits 10 seconds
#z1, z2 and z3 each wait 5 seconds.
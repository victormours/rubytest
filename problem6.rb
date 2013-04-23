class UsersController
    def find_active_users
        User.find(:all).select {|user| user.active?}
    end

    def find_active_users_properly
        User.where(active: true)
    end
end

#The find method returns an array, on which we subsequently use the select method.
#This means we are doing the DBMS's work in Ruby,
#and that's bad because it's slower and more memory-expensive
#find_active_users_efficiently does the same thing properly.
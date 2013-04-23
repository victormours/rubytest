module Problem1
    #This method takes some object that responds to the each method, like an array, and returns a string representation of the values
    #similar to what irb would display.
    def Problem1.something_unusual(values)
        temp = "["
        values.each do |value|
            temp += "#{value.to_s}, "
        end
        temp.chomp!(", ")
        temp += "]"
        return temp
    end
end
module Problem1
    #This method takes some object that responds to the each method, like an array, and returns a string representation of the values
    #similar to what irb would display.
    def Problem1.something_unusual(values)
        "[#{values.map{|v| v.to_s}.join ", "}]"
    end
end
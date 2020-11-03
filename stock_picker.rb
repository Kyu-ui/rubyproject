require 'pry'

def stock_picker(array)
    index_array = (0..(array.length)).to_a
    duplicate_array = array
    stock_hash = {}
    #easy find if highest and lowest is in the right order
    minmax_array = array.minmax
    if array.index(minmax_array[0]) < array.index(minmax_array[1])
        p "[#{array.index(minmax_array[0])}, #{array.index(minmax_array[1])}]"
    end
    
    
    stock_hash = {}
    duplicate_array.each do |value|
        int = duplicate_array.length - 1
        day_start = array.index(value)
        for x in 1..int
            key = value - duplicate_array[x]
            if day_start < x
                stock_hash[key] = [day_start, x]
            else
            end
    
        end
    end
p stock_hash.min
end

stock_picker([17,3,6,9,15,8,6,1,10,123,2,4444])


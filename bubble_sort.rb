require 'pry'

def bubble_sort(array)
    test = true
    iterations = array.length - 1
    test_int = array.length - 1
    while test == true
        for x in 1..test_int
            iterations = array.length - 1
            for x in 1..iterations
                first_obj = array[(iterations - 1)] #first number
                second_obj = array[iterations]  #last number
                if first_obj > second_obj
                    #so that they can happen in succession, x is utsed to sore a variable
                    x = array[(iterations - 1)]
                    array[(iterations -1)] = array[iterations]
                    array[iterations] = x
                end
                iterations -= 1
                end
            end
            binding.pry
        end
    end    

bubble_sort([5,7,2,8,9,6,2,5,7,78,3,3,423,42,44,21,421,4])


=begin
array = [5,7,2,9,8]
p array
iterations = array.length - 1
test = true
while test == true
    for x in 1..iterations
        first_obj = array[(iterations - 1)] #this is 8
        second_obj = array[iterations]  #this is 9
        if first_obj > second_obj
            #so that they can happen in succession, x is used to store a variable
            x = array[(iterations - 1)]
            array[(iterations -1)] = array[iterations]
            array[iterations] = x
        end
        iterations -= 1
        if iterations == 0
            p array
            test == false
        end
    end
end






Take array
iterations = array.length - 1
while test = true
    a index 0 up to index iteration.each do


    Check the right most index and the rightmost - 1 index, if right is less than swap the two. array[x] = array[y]



    have iterations - 1 each time it iterates a bubble sort

requires n - 1 sorts

make a counter so if not sorts are done, then stop the program

    
=end
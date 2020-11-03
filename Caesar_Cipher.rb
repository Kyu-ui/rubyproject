require 'pry'

Capital_Letters = ["A", "B", "C" , "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
Lowercase_Letters = []
Capital_Letters.each do |letter|
     x = letter.swapcase
    Lowercase_Letters.push(x)
end
outcome = []
outcome2 = ""
def Caesar_Shift(string, shift)
    puts "Enter your string"
    string = gets.chomp
    puts "Enter how many shifts"
    shift = gets.chomp.to_i
    new_array = string.split(//)
    new_array.each do |letter|
        if letter == " "
            puts "test"
        else new_array = Lowercase_Letters.find_index(letter)
            outcome = (new_array + shift) % 26
            outcome2 =+ Lowercase_Letters[outcome]
        end
    p outcome2
    end
end
Caesar_Shift("x", 2)

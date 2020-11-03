require 'pry'
dictionary = []

def substrings(string, dictionary)
    dictionary = ["hello","down","go","going","how","it","i","sit", "lo", "he", "hi", "world"]
    hash_dictionary = {}
    sentence = []
    string_input = ""
    n = 0
    puts "Enter your sentence here"
    string_input = gets.chomp.downcase!
    sentence = string_input.split(" ")
    sentence.each do |block|
        while block.length > 0 do
            if dictionary.any?(block)
                if hash_dictionary.has_key?(block)
                    hash_dictionary[block] += 1
                else  
                    hash_dictionary["#{block}"] = 1
                end
                block.chop!
            else 
                block.chop!
            end
        end
    end 
    p hash_dictionary 
end

substrings("hello", dictionary)


=begin
Add value but save print for the end using each enumerable


hash_dictionary = {"hello" => 1,"down" => 1,"go" => 1,"going" => 1,"how" => 1,"it" => 1,"i" => 1,"sit" => 1, "lo" => 1, "he" => 1, "hi" => 1, "world" => 1}




puts "#{block.to_s} "=>" #{hash_dictionary["#{block}"]}"
 hash_dictionary = {"hello" => 1,"down" => 1,"go" => 1,"going" => 1,"how" => 1,"it" => 1,"i" => 1,"sit" => 1, "lo" => 1, "he" => 1, "hi" => 1, "world" => 1}
=end
require 'pry'

$stop = false

module Players
    @@white_peg = 0
    @@red_peg = 0
    @@color_1 = ""
    @@color_2 = ""
    @@color_3 = ""
    @@color_4 = ""
    @@guess_color_1 = ""
    @@guess_color_2 = ""
    @@guess_color_3 = ""
    @@guess_color_4 = ""
    @@available_colors = ["blue", "red", "yellow", "orange", "green", "violet"]
    @@all_colors = []
    @@all_guess_colors = []

    def random_color_picker
        color_hash = {1 => "red", 2 => "blue", 3 => "yellow", 4 => "green", 5 => "violet", 6 => "orange"}
        @@color_1 = color_hash[rand(1..6)]
        @@color_2 = color_hash[rand(1..6)]
        @@color_3 = color_hash[rand(1..6)]
        @@color_4 = color_hash[rand(1..6)]
        @@all_colors.push(@@color_1, @@color_2, @@color_3, @@color_4)
    end

    def guess_checker
        if @@guess_color_1 == @@color_1
            @@red_peg += 1
        end
        if @@guess_color_2 == @@color_2
            @@red_peg += 1
        end
        if @@guess_color_3 == @@color_3
            @@red_peg += 1
        end
        if @@guess_color_4 == @@color_4
            @@red_peg += 1
        end
        @@all_guess_colors.each do |color|
            @@white_peg += @@all_colors.count(color)
            @@white_peg -= @@red_peg
            if @@white_peg < 0
                @@white_peg = 0
            end
            #SOMETHING WRONG HERE. IF THERE IS 3 OF SAME COLOR THAN WHITE PEGS ARE MESSED UP
        end    
        puts "Red peg: #{@@red_peg} White Peg: #{@@white_peg}"
    end 

    def next_round
        @@all_guess_colors.each do |color|
            @@all_guess_colors.pop
        end
        @@white_peg = 0
        @@red_peg = 0
    end

    def win_check
        if @@color_1 + @@color_2 + @@color_3 + @@color_4 == @@guess_color_1 + @@guess_color_2 + @@guess_color_3 + @@guess_color_4
            puts "Guesser you win!"
            $stop = true
        end
    end         
end

class Guesser
    include Players

    def initialize(name)
        @name = name
    end
    
    def guess()
        puts "Enter your guesses in order from left to right one by one. Your color choices are red, blue, yellow, orange, violet, green."
        begin
            @@guess_color_1 = gets.downcase.to_s.chomp
            raise unless @@available_colors.include?(@@guess_color_1)
            @@guess_color_2 = gets.downcase.to_s.chomp
            raise unless @@available_colors.include?(@@guess_color_2)
            @@guess_color_3 = gets.downcase.to_s.chomp
            raise unless @@available_colors.include?(@@guess_color_3)
            @@guess_color_4 = gets.downcase.to_s.chomp
            raise unless @@available_colors.include?(@@guess_color_4)
        rescue => e 
            puts "Cannot accept this. Check if thats a correcct color? Enter all colors again."
            binding.pry
            retry
        else
        @@all_guess_colors.push(@@guess_color_1, @@guess_color_2, @@guess_color_3, @@guess_color_4)
        guess_checker
        win_check
        next_round
        end
    end
end

class Master
    include Players

    def initialize(name)
        @name = name
    end

end


puts "Enter your name as the guesser"
guesser_name = gets.chomp
mastermind = Master.new("Computer")
mastermind.random_color_picker
player1 = Guesser.new("#{guesser_name}")
while $stop == false
    player1.guess
    break if $stop == true
    puts "Next round"
end






=begin
12 turns to guess the correct color pair
use random selection for the 4 correct pairs.
There are the red pegs and white pegs, present as white peg: #{num} and red peg #{num}
red peg means color is in right position and is right color
white peg means color is in wrong position but right color.
(issue with counting might be counting twice. be careful)



store correct colors in an array. store guess colors in array. 
if guess color is found in array, delete from master array and increase




   
=end
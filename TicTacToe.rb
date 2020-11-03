require 'pry'
$stop = false
module PlayerActions
    @@game_count = 0
    @@player_1_moves = []
    @@player_2_moves = []
    def listing_moves
        if @@game_count.odd? #Odd goes first
            @@player_1_moves.push(@@player_action)
            @@player_1_moves.sort
        end
        if @@game_count.even?
            @@player_2_moves.push(@@player_action)
            @@player_2_moves.sort
        end
    end
    def win_check
        if @@game_count.odd? #Odd goes first
            if @@player_1_moves.include?(1) and @@player_1_moves.include?(4) and @@player_1_moves.include?(7) or @@player_1_moves.include?(2) and @@player_1_moves.include?(5) and @@player_1_moves.include?(8)
                puts "#{@name} Wins"
                $stop = true
            end
            if @@player_1_moves.include?(3) and @@player_1_moves.include?(6) and @@player_1_moves.include?(9) or @@player_1_moves.include?(1) and @@player_1_moves.include?(2) and @@player_1_moves.include?(3)
                puts "#{@name} Wins"
                $stop = true
            end
            if @@player_1_moves.include?(4) and @@player_1_moves.include?(5) and @@player_1_moves.include?(6) or @@player_1_moves.include?(7) and @@player_1_moves.include?(8) and @@player_1_moves.include?(9)
                puts "#{@name} Wins"
                $stop = true
            end
            if @@player_1_moves.include?(1) and @@player_1_moves.include?(5) and @@player_1_moves.include?(9) or @@player_1_moves.include?(3) and @@player_1_moves.include?(5) and @@player_1_moves.include?(7)
                puts "#{@name} Wins"
                $stop = true
            end
        end

        if @@game_count.even?
            if @@player_2_moves.include?(1) and @@player_2_moves.include?(4) and @@player_2_moves.include?(7) or @@player_2_moves.include?(2) and @@player_2_moves.include?(5) and @@player_2_moves.include?(8)
                puts "#{@name} Wins"
                $stop = true
              end
              if @@player_2_moves.include?(3) and @@player_2_moves.include?(6) and @@player_2_moves.include?(9) or @@player_2_moves.include?(1) and @@player_2_moves.include?(2) and @@player_2_moves.include?(3)
                puts "#{@name} Wins"
                $stop = true
              end
              if @@player_2_moves.include?(4) and @@player_2_moves.include?(5) and @@player_2_moves.include?(6) or @@player_2_moves.include?(7) and @@player_2_moves.include?(8) and @@player_2_moves.include?(9)
                puts "#{@name} Wins"
                $stop = true
              end
              if @@player_2_moves.include?(1) and @@player_2_moves.include?(5) and @@player_2_moves.include?(9) or @@player_2_moves.include?(3) and @@player_2_moves.include?(5) and @@player_2_moves.include?(7)
                puts "#{@name} Wins"
                $stop = true
              end
        end
    end
    def row_check
        if @@game_count.odd? #Odd is player 1 and goes first
            if $row_1.include?(@@player_action)
                $row_1.insert($row_1.index(@@player_action), "o")
                $row_1.delete(@@player_action)
            end
            if $row_2.include?(@@player_action)
                $row_2.insert($row_2.index(@@player_action), "o")
                $row_2.delete(@@player_action)
            end
            if $row_3.include?(@@player_action)
                $row_3.insert($row_3.index(@@player_action), "o")
                $row_3.delete(@@player_action)
            end
        end
        if @@game_count.even?
            if $row_1.include?(@@player_action)
                $row_1.insert($row_1.index(@@player_action), "x")
                $row_1.delete(@@player_action)
            end
            if $row_2.include?(@@player_action)
                $row_2.insert($row_2.index(@@player_action), "x")
                $row_2.delete(@@player_action)
            end
            if $row_3.include?(@@player_action)
                $row_3.insert($row_3.index(@@player_action), "x")
                $row_3.delete(@@player_action)
            end
        end
    end

    def action
        puts "#{$row_1}\n#{$row_2}\n#{$row_3}"
        puts "Enter your move (only number 1 - 9)"
        begin
            @@player_action = gets.to_i 
            raise unless $combination_of_rows.include?(@@player_action)
        rescue => e
            puts "Cannot choose this. Try again."
            retry
        rescue => exception
            puts "Cannot accept this. Try again"
            retry
        else
            @@game_count += 1
            row_check
            listing_moves
            puts "This is the board now"
            puts "------------------------------------"
            $combination_of_rows = $row_1 + $row_2 + $row_3
            win_check
        end
    end
end


class Player1
    include PlayerActions
    def initialize(name)
        @name = name
    end
    def game_over
        #if have win conditions end the game and print player1 wins
    end
end

class Player2
    include PlayerActions
    def initialize (name)
        @name = name
    end
    def game_over
        #if have win conditions end the game and print player1 wins
    end

end








$row_1 = [1, 2, 3]
$row_2 = [4, 5, 6]
$row_3 = [7, 8, 9]
$combination_of_rows = $row_1 + $row_2 + $row_3
puts "Enter player 1's name"
player_1_name = gets.chomp 
puts "Enter player 2's name"
player_2_name = gets.chomp 
player1 = Player1.new(player_1_name)
player2 = Player2.new(player_2_name)
while $stop == false
    player1.action
    break if $stop == true
    player2.action
end


     




=begin
Potential class usage - 
Potential module usage -
Game contained inside while loop
Label board as numbers and store as variable
Create a class for each player
Create module that is the moves the players can choose
    Numbers that the player choose are replaced with x or o
    use begin rescue end if the player chooses number already chosen


    Player 1 will alwauys go first. Is o
    Add counter so the replacement of the number when the counter is odd is x

    Add every number each player chooses 
    Store the numbers in array and sort them
    check to see if player contain 
    WIN CONDITIONS IF ARRAY CONTAINS
    ---------------
    1 4 7
    2 5 8
    3 6 9
    1 2 3
    4 5 6 
    7 8 9
    1 5 9 
    3 5 7




    
=end
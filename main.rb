# main.rb
require_relative 'game'

def play_game
  puts "Welcome to Connect Four!"
  play_again = 'y'
  
  until play_again.downcase == 'n'
    game = Game.new

    until game.game_over
      game.gameboard.display_board
      print "#{game.current_player}: Enter a column (0-6) or 'exit' to quit: "
      user_input = gets.chomp

      if user_input.downcase == 'exit'
        return
      end

      result = game.drop_piece(user_input)
      
      case result
      when :invalid
        puts "#{game.current_player}: Invalid move. Enter a valid column (0-6):"
      when :winner
        game.gameboard.display_board
        puts "#{game.current_player} wins!"
      when :draw
        game.gameboard.display_board
        puts "It's a draw!"
      end
    end
    
    print "Game over! Do you want to play again? (y/n): "
    play_again = gets.chomp
  end
  
  puts "Thanks for playing!"
end

play_game()
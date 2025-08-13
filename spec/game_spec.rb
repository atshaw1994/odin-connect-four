require_relative '../game'

RSpec.describe Game do
  it "initializes with two players" do
    game = Game.new
    expect(game.player1).to eql('X')
    expect(game.player2).to eql('O')
  end

  it "drops a piece into a valid column (valid_move? True)" do
    game = Game.new
    expect(game.gameboard.valid_move?(0)).to be true
    game.drop_piece('0')
    expect(game.gameboard.board[5][0]).to eql('X')
  end

  it "drops a piece into an invalid column (valid_move? False)" do
    game = Game.new
    6.times { game.drop_piece('0') } # Fill the column
    expect(game.gameboard.valid_move?(0)).to be false
  end

  it "has a winner when four pieces are aligned horizontally" do
    game = Game.new
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('0') # X
    expect(game.has_winner?).to be true
  end

  it "has a winner when four pieces are aligned vertically" do
    game = Game.new
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('0') # X
    expect(game.has_winner?).to be true
  end

  it "has a winner when four pieces are aligned diagonally down-right" do
    game = Game.new
    game.drop_piece('5') # X
    game.drop_piece('0') # O
    game.drop_piece('0') # X
    game.drop_piece('0') # O
    game.drop_piece('0') # X
    game.drop_piece('5') # O
    game.drop_piece('1') # X
    game.drop_piece('1') # O
    game.drop_piece('1') # X
    game.drop_piece('2') # O
    game.drop_piece('2') # X
    game.drop_piece('5') # O
    game.drop_piece('3') # X
    expect(game.has_winner?).to be true
  end

  it "has a winner when four pieces are aligned diagonally up-right" do
    game = Game.new
    game.drop_piece('0') # X
    game.drop_piece('1') # O
    game.drop_piece('1') # X
    game.drop_piece('2') # O
    game.drop_piece('2') # X
    game.drop_piece('3') # O
    game.drop_piece('2') # X
    game.drop_piece('3') # O
    game.drop_piece('4') # X
    game.drop_piece('3') # O
    game.drop_piece('3') # X
    expect(game.has_winner?).to be true
  end

  it "detects a draw when the board is full without a winner" do  
    game = Game.new
    
    7.times do |i|
      3.times { game.drop_piece(i) }
    end
    game.drop_piece('1')
    7.times { |i| game.drop_piece(i) }
    7.times { |i| game.drop_piece(i) }
    game.drop_piece('0')
    game.drop_piece('2')
    game.drop_piece('3')
    game.drop_piece('4')
    game.drop_piece('5')
    game.drop_piece('6')

    expect(game.check_game_over).to be :draw
    expect(game.has_winner?).to be false
  end
end
require_relative 'gameboard'

class Game
  attr_reader :player1, :player2
  attr_accessor :current_player, :gameboard
  attr_reader :game_over

  def initialize
    @gameboard = Gameboard.new
    @player1 = 'X'
    @player2 = 'O'
    @current_player = @player1
    @game_over = false
  end

  def check_game_over
    if has_winner?
      @game_over = true
      return :winner
    elsif gameboard.board_full?
      @game_over = true
      return :draw
    end
    @game_over = false
    :ongoing
  end

  def has_winner?
    (0..5).any? do |row_idx|
      (0..6).any? do |col_idx|
        piece = gameboard.board[row_idx][col_idx]
        next if piece.nil?
        check_all_win_conditions(row_idx, col_idx, piece)
      end
    end
  end

  def drop_piece(column_str)
    column = column_str.to_i
    return :invalid unless gameboard.valid_move?(column)

    gameboard.drop_piece(column, @current_player)
    
    # Check the game state after a valid move
    game_state = check_game_over
    switch_player unless game_state != :ongoing
    
    game_state
  end

  private

  def check_all_win_conditions(row_idx, col_idx, piece)
    check_horizontal_win(row_idx, col_idx, piece) ||
    check_vertical_win(row_idx, col_idx, piece) ||
    check_diagonal_down_right_win(row_idx, col_idx, piece) ||
    check_diagonal_up_right_win(row_idx, col_idx, piece)
  end

  def check_horizontal_win(row_idx, col_idx, piece)
    col_idx <= 3 && gameboard.board[row_idx][col_idx, 4].all? { |c| c == piece }
  end

  def check_vertical_win(row_idx, col_idx, piece)
    row_idx <= 2 && (0..3).all? { |i| gameboard.board[row_idx + i][col_idx] == piece }
  end

  def check_diagonal_down_right_win(row_idx, col_idx, piece)
    row_idx <= 2 && col_idx <= 3 && (0..3).all? { |i| gameboard.board[row_idx + i][col_idx + i] == piece }
  end

  def check_diagonal_up_right_win(row_idx, col_idx, piece)
    row_idx >= 3 && col_idx <= 3 && (0..3).all? { |i| gameboard.board[row_idx - i][col_idx + i] == piece }
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
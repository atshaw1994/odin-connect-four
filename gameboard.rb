class Gameboard
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, nil) }
  end

  def display_board
    puts "\n  " + (0...board[0].size).to_a.join(' ')
    board.each do |row|
      row_str = row.map { |cell| cell.nil? ? ' ' : cell }.join(' ')
      puts "  #{row_str}"
    end
  end

  def drop_piece(column, piece)
    row_index = board.rindex { |row| row[column].nil? }
    return false if row_index.nil?

    board[row_index][column] = piece
    true
  end

  def valid_move?(column)
    column.is_a?(Integer) && column >= 0 && column < board[0].size && board[0][column].nil?
  end

  def board_full?
    board[0].none?(&:nil?)
  end
end
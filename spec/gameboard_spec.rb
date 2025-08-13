require_relative '../gameboard'

RSpec.describe Gameboard do
  let(:gameboard) { Gameboard.new }

  describe "#initialize" do
    it "creates a 6x7 board filled with nil" do
      expect(gameboard.board.size).to eq(6)
      expect(gameboard.board.first.size).to eq(7)
      
      gameboard.board.each do |row|
        expect(row.all?(&:nil?)).to be true
      end
    end
  end

  describe "#drop_piece" do
    it "places a piece in the lowest available row" do
      gameboard.drop_piece(0, 'X')
      expect(gameboard.board[5][0]).to eq('X')
    end

    it "places a second piece above the first one" do
      gameboard.drop_piece(0, 'X')
      gameboard.drop_piece(0, 'O')
      expect(gameboard.board[4][0]).to eq('O')
      expect(gameboard.board[5][0]).to eq('X')
    end
  end

  describe "#valid_move?" do
    it "returns true for a valid column" do
      expect(gameboard.valid_move?(3)).to be true
    end

    it "returns false for a column that is out of bounds" do
      expect(gameboard.valid_move?(7)).to be false
    end

    it "returns false for a column that is full" do
      6.times { gameboard.drop_piece(0, 'X') }
      expect(gameboard.valid_move?(0)).to be false
    end
  end
end
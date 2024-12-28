require_relative "../lib/column"
require_relative "../lib/board"

describe Board do
  subject(:test_board) { described_class.new}
  describe "#add_chip" do
    it "returns false if the column is not correct" do
      expect(test_board.add_chip(-1,1)).to be(false)
    end
    it "returns false if the chip is not correct" do 
      expect(test_board.add_chip(3,4)).to be(false)
    end    
    it "puts a chip in a column correctly" do
      test_board.add_chip(3,2)
      test_board.add_chip(3,1)
      test_board.add_chip(3,2)
      my_column= test_board.get_column(3).get_chips
      expect(my_column).to eql([2,1,2,0,0,0])
    end
    it "returns false if the column is full" do
      test_board.add_chip(3,2)
      test_board.add_chip(3,1)
      test_board.add_chip(3,2)
      test_board.add_chip(3,2)
      test_board.add_chip(3,1)
      test_board.add_chip(3,2)
      expect(test_board.add_chip(3,1)).to be(false)
    end
  end

  describe "#get_board" do
    it "returns an empty board" do
      my_board = test_board.get_board
      expect(my_board[3].get_chips).to eql([0,0,0,0,0,0])
    end
    it "returns a board with chips - test 1" do
      test_board.add_chip(1,1)
      test_board.add_chip(1,1)
      test_board.add_chip(1,2)
      test_board.add_chip(1,1)
      test_board.add_chip(7,2)
      test_board.add_chip(7,1)
      my_board = test_board.get_board
      expect(my_board[0].get_chips).to eql([1,1,2,1,0,0])
    end
    it "returns a board with chips - test 2" do
      test_board.add_chip(1,1)
      test_board.add_chip(1,1)
      test_board.add_chip(1,2)
      test_board.add_chip(1,1)
      test_board.add_chip(7,2)
      test_board.add_chip(7,1)
      my_board = test_board.get_board
      expect(my_board[6].get_chips).to eql([2,1,0,0,0,0])
    end
  end
  
  describe "#get_column" do 
    it "returns nil if the column does not exist" do
      my_column= test_board.get_column(8)
      expect(my_column).to be_nil
    end

    it "returns an empty column" do
      my_column= test_board.get_column(7).get_chips
      expect(my_column).to eql([0,0,0,0,0,0])
    end

    it "returns a column with chips" do
      test_board.add_chip(1,1)
      test_board.add_chip(1,2)
      test_board.add_chip(1,2)
      test_board.add_chip(1,1)
      my_column= test_board.get_column(1).get_chips
      expect(my_column).to eql([1,2,2,1,0,0])
    end
  end

  describe "#clear" do
    it "empties a full board -test 1" do
      test_board.add_chip(1,1)
      test_board.add_chip(1,1)
      test_board.add_chip(1,2)
      test_board.add_chip(1,1)
      test_board.add_chip(7,2)
      test_board.add_chip(7,1)
      test_board.clear
      my_column= test_board.get_column(1).get_chips
      expect(my_column).to eql([0,0,0,0,0,0])
    end
    it "empties a full board -test 2" do
      test_board.add_chip(1,1)
      test_board.add_chip(1,1)
      test_board.add_chip(1,2)
      test_board.add_chip(1,1)
      test_board.add_chip(7,2)
      test_board.add_chip(7,1)
      test_board.clear
      my_column= test_board.get_column(7).get_chips
      expect(my_column).to eql([0,0,0,0,0,0])
    end
  end

  describe "#is_full?" do
    it "returns true if the board is full" do
      (1..7).each do |col|
        6.times {test_board.add_chip(col,1)}
      end
      expect(test_board.is_full?).to be(true)
    end
    
    it "returns false if the board is not full" do
      (1..7).each do |col|
        5.times {test_board.add_chip(col,1)}
      end
      expect(test_board.is_full?).to be(false)
    end
  end
  describe "#find_winner" do
    xit "Finds a winner in a column" do
      test_board.add_chip(4,1)
      test_board.add_chip(4,2)
      test_board.add_chip(4,2)
      test_board.add_chip(4,2)
      test_board.add_chip(4,2)
      test_board.add_chip(4,1)
      expect(test_board.find_winner).to eq("2C4")
    end
    xit "Finds a winner in a row" do
      test_board.add_chip(2,1)
      test_board.add_chip(3,2)
      test_board.add_chip(4,2)
      test_board.add_chip(5,1)
      test_board.add_chip(2,1)
      test_board.add_chip(3,1)
      test_board.add_chip(4,1)
      test_board.add_chip(5,1)
      expect(test_board.find_winner).to eq("1R2")
    end
    xit "Finds a winner in top-left to right-down diagonal" do
      test_board.add_chip(2,1)
      test_board.add_chip(3,1)
      test_board.add_chip(4,1)
      test_board.add_chip(2,1)
      test_board.add_chip(3,1)
      test_board.add_chip(2,1)
      test_board.add_chip(2,2)
      test_board.add_chip(3,2)
      test_board.add_chip(4,2)
      test_board.add_chip(5,2)
      expect(test_board.find_winner).to eq("2DL24")
    end
    xit "Finds a winner in top-right to left-down diagonal" do
      test_board.add_chip(7,1)
      test_board.add_chip(6,1)
      test_board.add_chip(5,1)
      test_board.add_chip(4,2)
      test_board.add_chip(7,2)
      test_board.add_chip(6,2)
      test_board.add_chip(5,1)
      test_board.add_chip(7,2)
      test_board.add_chip(6,1)
      test_board.add_chip(7,1)
      test_board.add_chip(7,1)
      test_board.add_chip(6,1)
      test_board.add_chip(5,1)
      test_board.add_chip(4,1)
      expect(test_board.find_winner).to eq("1DR75")
    end
    xit "Does not find any winner" do
      (1..3).each do |col|
        (1..3).times {test_board.add_chip(col,1)}
        (4..6).times {test_board.add_chip(col,2)}
      end
      (4..6).each do |col|
        (1..3).times {test_board.add_chip(col,2)}
        (4..6).times {test_board.add_chip(col,1)}
      end
      (1..3).times {test_board.add_chip(7,1)}
      (1..3).times {test_board.add_chip(7,2)}
      expect(test_board.find_winner).to eq(0)
    end
  end
end
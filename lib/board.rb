require_relative "column"

class Board
  MAX_WIDTH = 7

  def initialize
    clear
  end

  def clear
    @board = Array.new(MAX_WIDTH) {Column.new}
  end

  def get_board
    @board
  end

  def get_column(col)
    return nil if col < 1 || col > MAX_WIDTH
    @board[col-1]
  end

  def add_chip(col, chip)
    return false if col < 1 || col > MAX_WIDTH
    @board[col-1].add_chip(chip)
  end

  def is_full?
    full = true
    @board.each do |col|
      if !col.is_full?
        full = false
        break
      end
    end
    full
  end
end
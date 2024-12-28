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

  def find_winner
    winner = find_column_winner
    winner = find_row_winner if winner == 0
    winner = find_left_diagonal_winner if winner == 0
    winner = find_right_diagonal_winner if winner == 0
    winner
  end

  def draw
    puts
    puts "|1|2|3|4|5|6|7|"
    mh = @board[0].max_height-1
    (0..mh).each do |row| 
      print"|"
      (0..MAX_WIDTH-1).each do |col|
        chip = @board[col].get_chips[mh - row]
        case (chip)
        when 0
          print " "
        when 1
          print "X"
        when 2
          print "O"
        end
        print "|"
      end
      puts
    end
  end

  private 

  def find_column_winner
    winner = 0
    @board.each_with_index do |col, i|
      winner = col.find_winner
      if winner !=0
        winner = winner.to_s.concat("C").concat((i+1).to_s)
        break
      end
    end
    winner
  end

  def find_row_winner
    winner = 0
    (0..@board[0].max_height-1).each do |row|
      (0..MAX_WIDTH-4).each do |col|
        the_chip = @board[col].get_chips[row]
        if the_chip != 0 && the_chip == @board[col+1].get_chips[row] && the_chip == @board[col+2].get_chips[row] && the_chip == @board[col+3].get_chips[row] 
          winner = the_chip.to_s.concat('R').concat((row+1).to_s)
          break
        end
      end
    end
    winner
  end
  
  def find_left_diagonal_winner
    winner = 0
    (3..@board[0].max_height-1).each do |row|
      (0..MAX_WIDTH-4).each do |col|
        the_chip = @board[col].get_chips[row]
        if the_chip != 0 && the_chip == @board[col+1].get_chips[row-1] && the_chip == @board[col+2].get_chips[row-2] && the_chip == @board[col+3].get_chips[row-3] 
          winner = the_chip.to_s.concat('DL').concat((col+1).to_s).concat((row+1).to_s)
          break
        end
      end
    end
    winner
  end
    
  def find_right_diagonal_winner
    winner = 0
    (0..@board[0].max_height-4).each do |row|
      (0..MAX_WIDTH-4).each do |col|
        the_chip = @board[col].get_chips[row]
        if the_chip != 0 && the_chip == @board[col+1].get_chips[row+1] && the_chip == @board[col+2].get_chips[row+2] && the_chip == @board[col+3].get_chips[row+3] 
          winner = the_chip.to_s.concat('DR').concat((col+1).to_s).concat((row+1).to_s)
          break
        end
      end
    end
    winner
  end
end
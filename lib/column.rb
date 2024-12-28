class Column
  MAX_HEIGTH = 6

  def initialize
    clear
  end

  def clear
    @chips = Array.new(MAX_HEIGTH,0)
  end

  def get_chips
    @chips
  end

  def add_chip(new_chip)
    return false if new_chip!=1 && new_chip!=2
    there_is_room = false
    @chips.each_with_index do |chip, i|
      if chip == 0
        @chips[i] = new_chip
        there_is_room = true
        break
      end
    end
    there_is_room
  end

  def is_full?
    @chips[MAX_HEIGTH-1]!=0
  end

  def find_winner
    winner = 0 
    (0..MAX_HEIGTH-4).each do |i|
      if @chips[i] == 1 && @chips[i+1] == 1 && @chips[i+2] == 1 && @chips[i+3] == 1 
        winner = 1
        break
      elsif @chips[i] == 2 && @chips[i+1] == 2 && @chips[i+2] == 2 && @chips[i+3] == 2
        winner = 2
        break
      end
    end
    winner
  end
end
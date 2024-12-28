#Apart of using Rspec, I need a visual test to check visually the position of the chips in the board

require_relative "../lib/board"

#New empty board
test_board = Board.new
test_board.draw

#Let's put some chips
test_board.add_chip(7,1)
test_board.add_chip(6,1)
test_board.add_chip(5,1)
test_board.add_chip(7,1)
test_board.add_chip(6,1)
test_board.add_chip(7,1)
test_board.add_chip(7,2)
test_board.add_chip(6,2)
test_board.add_chip(5,2)
test_board.add_chip(4,2)
test_board.draw

#Let's clear the board
test_board.clear
test_board.draw

#Let's fill completly the board
(1..3).each do |col|
  3.times {test_board.add_chip(col,1)}
  3.times {test_board.add_chip(col,2)}
end
(4..6).each do |col|
  3.times {test_board.add_chip(col,2)}
  3.times {test_board.add_chip(col,1)}
end
3.times {test_board.add_chip(7,1)}
3.times {test_board.add_chip(7,2)}
test_board.draw

#Let's fill completly the board in another way
test_board.clear
3.times do
  (1..2).each do |chip|
    (1..3).each do |col|
      test_board.add_chip(col,chip)
    end
    test_board.add_chip(4,chip==1?2:1)
    (5..7).each do |col|
      test_board.add_chip(col,chip)
    end
  end
end
test_board.draw

#Finally, if we try to add more chips...
6.times do
  (1..7).each {|col| test_board.add_chip(col,1)}
end
test_board.draw



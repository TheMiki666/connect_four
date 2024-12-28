#Instead of using Rspec, we tested the player input (in the method #ask_for_move)
#just playing it, and trying different inputs
#Why? Because it's easier and faster by this way

require_relative "../lib/game_manager"

gm = GameManager.new

puts gm.ask_for_move

# TEST RESULT: OK
# ask_for_move only can return this values:
# 1, 2, 3, 4, 5, 6, 7
# "BREAK"
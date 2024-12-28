# connect_four
Connect Four game made at TDD style with RSpec

# Notes

* All the methods of the class Column have been developed by TDD, using RSpec (file column_test.rb)
* Almost all the methods of the class Column have been developed by TDD, using RSpec (file board_test.rb)
  The exception has been the method #draw. Instead of using TDD, it has been checked visually on terminal, adding chips to the board
  and calling method #draw (see file draw_board_visual_test)
* Some of the methods of GameManager class have been developed by TDD, as well:
    #Ask_for_move
    #Switch player
* The method GameManager#ask_for_move has been tried playing it directly, observing the behaviour after the player input 
  (see file game_manager_input.rb)
* The rest of the methods of GameManager have been copied (and modified) from TicTacToe::GameManagerClass, and tried all together playing
  the whole game in main.rb file.

  Why didn't I make all the methods using TDD? Well, I considered that TDD is useful in some occasions; mainly when the basic methods are
  being built. But that way of development is not very useful when...
   * You want to visualize draws, boards or similar on screen
   * You want to test the behaviour of the program depending on the user response, especially when you want to try almost all the possible responses
   * You want to reuse some code already tried in other applications
   * You want to try the application completly or almost completly finished

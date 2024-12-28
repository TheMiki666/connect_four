require_relative "board"
require_relative "column"
require "colorize"

class GameManager
  
  def initialize
    @board = Board.new
    @score_1 = 0
    @score_2 = 0
    @first_turn = 1
    
  end

  def start
    greet
    new_game
    
  end

  def greet
    puts '***************************'.colorize(:blue)
    puts '* Welcome to Connect Four *'.colorize(:blue)
    puts '***************************'.colorize(:blue)
    puts
    puts 'This is a game for tWo players:'
    puts present_player(1).concat(' and ').concat(present_player(2))
    puts
    print 'Press enter to continue'
    gets
  end

  def ask_for_move
    response = false
    loop do
      ok = false
      puts present_player(@turn).concat(" enter your move, please:")
      response = gets.chomp
      break if response == 'BREAK'
      puts
      if response.length != 1
        incorrect_input_warn
        response = false
      else
        response = response.to_i
        if !response.is_a?(Integer) || response < 1 || response >7
          incorrect_input_warn
          response = false
        end
      end
      break if response
    end
    response
  end

  def switch_player(player)
    if player == 1 
      2
    elsif player == 2
      1
    end
  end

  private

  def present_player(player)
    if player == 1
      "Player 1".colorize(:red)
    else
      "Player 2".colorize(:green)
    end
  end

  def new_game
    @board.clear
    puts
    puts "Let's start the game!"
    puts present_player(@first_turn).concat(" makes first movement")
    puts
    @turn = @first_turn
    @first_turn = switch_player(@first_turn)
    game_loop
  end

  def game_loop
    loop_exit = 0 # 0: no exit; 1: there is a winner 2: draw; #3: player wants to break
    loop do
      @board.draw
      puts
      response = ask_for_move
      loop_exit = 3 if response == 'BREAK'
      break if loop_exit == 3

      # now we try to set the chip at the column said by the player
      if @board.add_chip(response, @turn)
        # correct movement
        @turn = switch_player(@turn)
        winning = @board.find_winner
        if winning!=0
          loop_exit = 1
        elsif @board.is_full?
          loop_exit = 2
        end
      else
        puts 'INCORRECT MOVEMENT'.colorize(:yellow)
        puts 'That column is full'.colorize(:yellow)
        puts
      end
      break if loop_exit > 0
    end
    case loop_exit
    when 1
      winning
      ask_for_another_game
    when 2
      tie
      ask_for_another_game
    when 3
      end_game
    end
  end

  def incorrect_input_warn
    puts 'INCORRECT INPUT'.colorize(:yellow)
    instructions
  end

  def instructions
    puts "Choose column 1 to 7 to put a chip"
    puts "Write 'BREAK' if you want to finish the game"
  end

  def ask_for_another_game
    answer = ''
    loop do
      puts 'Do you want to play another game?(y/n)'
      answer = gets.chop
      answer = answer.downcase
      break if %w[y n].include?(answer)
    end
    if answer == 'y'
      new_game
    else
      end_game
    end
  end

  def end_game
    show_scores
    puts 'Thanks for playing!'
  end

  def show_scores
    puts present_player(1).concat(" has won #{@score_1} matches")
    puts present_player(2).concat(" has won #{@score_2} matches")
    puts
  end

  def tie
    @board.draw
    puts
    puts 'The board is full, and nobody has made a line.'.colorize(:blue)
    puts "It's a tie!".colorize(:blue)
    puts
    show_scores
  end

  def winning
    @board.draw
    puts
    win_code = @board.find_winner
    message = 'There is a winning line on '
    case win_code[1]
    when 'R'
      puts message.concat("row number #{win_code[2]}!")
    when 'C'
      puts message.concat("column number #{win_code[2]}!")
    when 'D'
      puts message.concat(win_code[2] == 'L' ? 'top-left to bottom-right' : 'bottom-left to top-right').concat(' diagonal,')
      puts "starting on column #{win_code[3]} and row #{win_code[4]}"
    end
    winner = win_code[0].to_i
    puts present_player(winner).concat(" wins!")
    puts
    if winner == 1
      @score_1 += 1
    elsif winner == 2
      @score_2 += 1
    end
    show_scores
  end
end
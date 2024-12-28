require_relative "board"
require_relative "column"
require "colorize"

class GameManager
  
  def initialize
    @board=Board.new
  end

  def greet
    puts '***************************'.colorize(:blue)
    puts '* Welcome to Connect Four *'.colorize(:blue)
    puts '***************************'.colorize(:blue)
    puts
    puts 'This is a game for tWo players:'
    puts 'Player '.concat(("1").colorize(:red)).concat(' and Player ').concat(('2').colorize(:green))
    puts
    print 'Press enter to continue'
    gets
  end
end
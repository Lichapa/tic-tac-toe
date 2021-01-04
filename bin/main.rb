#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe game.'
puts ' '
puts '----------------Instructions------------'
puts 'The game require two players'
puts 'Player can choose number 1 to 9 to represent a move    '
puts 'But a number(move) can only be played once'
puts ''

require_relative '../lib/player'
require_relative '../lib/board'

class GamePlay
  attr_accessor :board
  attr_reader :name, :symbol

  def initialize()
    players
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = Board.new(arr)
    play
    make_move
  end

  def play()
    until @board.full?(@board.space)
      @player.make_move(@player, @board, @board.space)
      break if @board.win?(@board.space, @player)

      change_player(@player)
    end

    if @board.win?(@board.space, @player)
      puts "Congratulations, #{@player.name} wins!"
      play_again?
    elsif @board.full?(@board.space)
      puts "It's a Tie"
      play_again?
    end
  end

  def players
    puts 'Player 1, Enter your Name: '
    player1 = gets.chomp
    @x = Player.new(player1, 'X')
    puts 'Player 2, Enter your Name: '
    player2 = gets.chomp
    @o = Player.new(player2, 'O')
    @player = @x
  end

  # Switch player
  def change_player(player)
    @player = if player == @x
                @o
              else
                @x
              end
  end

  def play_again?
    answer = ''
    while answer != 'Y' && answer != 'N'
      puts 'Play again? (Y/N)'
      answer = gets.chomp.capitalize
    end
    case answer
    when 'Y'
      GamePlay.new
    when 'N'
      exit
    end
  end
end

public

def make_move(player, board, move)
  print "#{name}, It's your turn. Please make your move: "
  placement = gets.chomp
  index = get_index(placement)
  until valid_move?(move, index)
    puts 'Please pick a valid number above'
    placement = gets.chomp
    index = get_index(placement)
  end
  board.update_board(player, index)
end

GamePlay.new

#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe game.'
puts ' '
puts '----------------Instructions------------'
puts 'The game require two players'
puts 'Player can choose number 1 to 9 to represent a move    '
puts 'But a number(move) can only be played once'
puts ''

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

class GamePlay
  attr_accessor :board

  def initialize()
    players
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = Board.new(arr)
    play
  end

  def play()
    until @board.full?(@board.space)
      @player.make_move(@player, @board, @board.space)
      break if @board.win?(@board.space, @player)

      change_player(@player)
    end

    if @board.win?(@board.space, @player)
      puts "Congratulations, #{@player.name} wins!"
      exit
    elsif @board.full?(@board.space)
      puts "Cat's game!"
      exit
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
end

GamePlay.new

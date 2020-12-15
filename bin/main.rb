#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe game.'
puts ' '
puts '----------------Instructions------------'
puts 'The game require two players'
puts 'Player can choose number 1 to 9 to represent a move    '
puts 'But a number(move) can only be played once'
puts ''

class Player
  attr_accessor :player_x, :player_o

  def initialize
    # Collect names if the players
    puts 'Player 1, Enter Name:'
    @player_x = gets.chomp
    puts 'Player 2, Enter Name:'
    @player_o = gets.chomp
    # Show the name of the player and the symbol
    puts "#{@player_x} will be X AND #{@player_o} will be O"
  end
end

class Board
  attr_accessor :board

  # Show what the Tic Tac Toe Board look like

  def initialize
    board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
  # Display board after a player has played
  def display_board
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '---------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '---------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

class Game
  # Start a new game by geting player names
  def initialize
    @player = Player.new
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def play
    game_on = true

    while game_on

      
      puts 'X, Enter 1-9 to play:'
      player_x_move = gets.chomp


      puts 'O, Enter 1-9 to play:'
      player_o_move = gets.chomp

      puts "x played #{player_x_move} And o played #{player_o_move}"
      

      winning_move = 'Congrads, You have won the game!'
      draw = "It's a draw game."
      invalid_move = 'The move in not valid, Please try again'

      puts [winning_move, draw, invalid_move].sample

      game_on = false
    end
    display_board
  end

  def valid_move
    # check if the input is between 1 and 9
    # Check if the move has already been played
    # Tell the user to make a valid move. (Return valid moves available)
  end

  def winning_move
    # Check if there is a winning combination
    # display who has won the game
  end

  def draw
    # check if all the moves have been played
    # check if the game has ended in a draw
    # display that the game is a draw
  end

  def game_over
    # check if there is a winner
    # check if the game is a draw
    # check if user request to quit the game (q)
    # exit game
  end
end
game = Game.new
game.play

puts 'Thank you for playing'

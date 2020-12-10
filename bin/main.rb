#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe game.'
puts '\n\n'
puts '----------------Instructions------------'
puts 'The game require two players'
puts 'Player can choose number 1 to 9 to represent a move    '
puts 'But a number(move) can only be played once'
puts ''

class Player
  attr_accessor :playerX
  attr_accessor :playerO
  def initialize
    # Collect names if the players
    puts 'Player 1, Enter Name:'
    @playerX = gets.chomp
    puts 'Player 2, Enter Name:'
    @playerO = gets.chomp
    # Show the name of the player and the symbol
    puts "#{@playerX} will be X AND #{@playerO} will be O"
  end
end

class Board
  attr_reader:board

  # Show what the Tic Tac Toe Board look like
  def initialize
    puts 'This is the board of Tic Tac Toe '
    puts '  ___ ___ ___  '
    puts ' | 1 | 2 | 3 | '
    puts ' |___|___|___| '
    puts ' | 4 | 5 | 6 | '
    puts ' |___|___|___| '
    puts ' | 7 | 8 | 9 | '
    puts ' |___|___|___| '
    puts '               '

    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # Display board after a player has played
  def display_board(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "---------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "---------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

class Game
  #Start a new game by geting player names
  def initialize
    @player = Player.new
  end

  def play
    moves = 0 
    while moves < 9
      puts 'X, Enter 1-9 to play:'
      playerXMove = gets.chomp
      puts "#{@board}"

      puts 'O, Enter 1-9 to play:' 
      playerOMove = gets.chomp
      puts "#{@board}"

      moves += 2
    end
  end

  def validMove
    # check if the input is between 1 and 9
    # Check if the move has already been played
    # Tell the user to make a valid move. (Return valid moves available)
  end
  def winningMove
    # Check if there is a winning combination
    # display who has won the game
  end

  def draw
    # check if all the moves have been played
    # check if the game has ended in a draw
    # display that the game is a draw
  end

  def gameOver
    # check if there is a winner
    # check if the game is a draw
    # check if user request to quit the game (q)
    # exit game
  end

end

game = Game.new
game.play

puts 'Thank you for playing'



#!/usr/bin/env ruby

puts 'Welcome to Tic Tac Toe game.'
puts ' '
puts '----------------Instructions------------'
puts 'The game require two players'
puts 'Player can choose number 1 to 9 to represent a move    '
puts 'But a number(move) can only be played once'
puts ''
class GamePlay

  attr_accessor :board

  def initialize()
    get_players
    arr = [1,2,3,4,5,6,7,8,9]
    @board = Board.new(arr)
    play
  end

  #Game play
  def play()

    while !@board.full?(@board.space)
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

  #Get player names
  def get_players
    puts "Player 1, Enter your Name: "
    player1 = gets.chomp
    @x = Player.new(player1, "X")
    puts "Player 2, Enter your Name: "
    player2 = gets.chomp
    @o = Player.new(player2, "O")
    @player = @x
  end

  #Switch player
  def change_player(player)
    if (player == @x)
      @player = @o
    else
      @player = @x
    end
  end

end

class Board 
  attr_accessor :space

  WIN_COMBINATIONS = [ 
  [0,1,2], # top_row 
  [3,4,5], # middle_row 
  [6,7,8], # bottom_row 
  [0,3,6], # left_column 
  [1,4,7], # center_column 
  [2,5,8], # right_column 
  [0,4,8], # left_diagonal 
  [6,4,2] # right_diagonal 
  ]

  def initialize(space)
    @space = space
    display_board
  end

  #Create a new board
  def display_board()
      puts "| #{@space[0]} | #{@space[1]} | #{@space[2]} |"
      puts "---------------"
      puts "| #{@space[3]} | #{@space[4]} | #{@space[5]} |"
      puts "---------------"
      puts "| #{@space[6]} | #{@space[7]} | #{@space[8]} |"
      puts
  end

  #Update the board
  def update_board(player, move)
    @space[move] = "#{player.symbol}"
    display_board
  end

  def full?(board)
    board.all? {|i| i == "X" || i == "O"}
  end

  def win?(board, player)
      WIN_COMBINATIONS.any? do |combo|
      combo.all? {|cell| board[cell] == player.symbol} 
    end
  end

end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def make_move(player, board, move)
    print "#{name}, It's your turn. Please make your move:"
      placement = gets.chomp
      index = get_index(placement)
      while !valid_move?(move, index)
        puts "Please pick a valid number above"
        placement = gets.chomp
        index = get_index(placement)
      end
      board.update_board(player, index)
  end

  def get_index(input)
    input.to_i - 1
  end

  def position_taken?(board, index)
    board[index] == "X" || board[index] == "O"
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index) 
  end

end

game = GamePlay.new
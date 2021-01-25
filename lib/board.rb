class Board
  attr_accessor :space

  WIN_COMBINATIONS = [
    [0, 1, 2], # top_row
    [3, 4, 5], # middle_row
    [6, 7, 8], # bottom_row
    [0, 3, 6], # left_column
    [1, 4, 7], # center_column
    [2, 5, 8], # right_column
    [0, 4, 8], # left_diagonal
    [6, 4, 2] # right_diagonal
  ].freeze

  def initialize(space)
    @space = space
  end

  # Create a new board
  def display_board
    puts "| #{@space[0]} | #{@space[1]} | #{@space[2]} |"
    puts '---------------'
    puts "| #{@space[3]} | #{@space[4]} | #{@space[5]} |"
    puts '---------------'
    puts "| #{@space[6]} | #{@space[7]} | #{@space[8]} |"
  end

  # Update the board
  def update_board(player, move)
    @space[move] = player.symbol.to_s
    display_board
  end

  def full?(board)
    board.all? { |i| %w[X O].include?(i) }
  end

  def win?(board, player)
    WIN_COMBINATIONS.any? do |combo|
      combo.all? { |cell| board[cell] == player.symbol }
    end
  end
end

require_relative '../lib/board'

module Game
  attr_accessor :board, :player

  def initialize(player)
    @player = player
    @board = Board.new(arr)
  end

  def get_index(input)
    input.to_i - 1
  end

  def position_taken?(board, index)
    board[index] == 'X' || board[index] == 'O'
  end

  def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
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

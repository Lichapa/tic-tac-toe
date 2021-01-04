class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
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
end

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
    until valid_move?(move, index)
      puts 'Please pick a valid number above'
      placement = gets.chomp
      index = get_index(placement)
    end
    board.update_board(player, index)
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
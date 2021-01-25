require 'spec_helper'
require_relative '../lib/player'
require_relative '../lib/board'

describe Board do
  let(:space) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:board) { Board.new(space) }
  let(:x) { Player.new('Mphatso', 'X') }

  describe '#display_board' do
    it 'return empty board' do
      expect(board.display_board).to be nil
    end

    # it 'check if the space an empty array' do
    #   expect(space{[4]}).to eql(space{[7]})
    # end

    # it 'should check for player1' do
    #   expect(board.player1).to eql(player1)
    # end
  end
end

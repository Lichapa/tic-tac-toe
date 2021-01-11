# spec/player_spec.rb
require_relative 'spec_helper'
require 'player'

describe Player do
  let(:x) { Player.new('player1', 'X') }
  let(:o) { Player.new('player2', 'O') }

  describe '#initialize' do
    it 'returns player1 name' do
      expect(x.name).to eql('player1')
    end

    it 'returns player1 symbol' do
      expect(x.symbol).to eql('X')
    end

    it 'returns player1 name' do
      expect(o.name).to eql('player2')
    end

    it 'returns player1 symbol' do
      expect(o.symbol).to eql('O')
    end
  end
end

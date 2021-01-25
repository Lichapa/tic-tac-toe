# spec/player_spec.rb
require_relative 'spec_helper'
require 'player'
require 'board'

describe Player do
  let(:x) { Player.new('Mphatso', 'X') }
  let(:o) { Player.new('Annand', 'O') }

  describe '#initialize' do
    it 'returns player1 name' do
      expect(x.name).to eql('Mphatso')
    end

    it 'returns player1 symbol' do
      expect(x.symbol).to eql('X')
    end

    it 'returns player2 name' do
      expect(o.name).to eql('Annand')
    end

    it 'returns player2 symbol' do
      expect(o.symbol).to eql('O')
    end
  end
end

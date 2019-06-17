# frozen_string_literal: true

require 'scores/victory'

RSpec.describe Scores::Victory do
  subject do
    described_class.new(
      player1_points: player1_points,
      player2_points: player2_points,
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  let(:player1_points) { 1 }
  let(:player2_points) { 4 }
  let(:player1_name) { 'Player 1' }
  let(:player2_name) { 'Player 2' }

  context '#victory?' do
    it 'returns true' do
      expect(subject.victory?).to be(true)
    end
  end

  context '#player1_won?' do
    context 'when points are 1 - 4' do
      it 'returns false' do
        expect(subject.player1_won?).to be(false)
      end
    end

    context 'when points are 4 - 1' do
      let(:player1_points) { 4 }
      let(:player2_points) { 1 }

      it 'returns true' do
        expect(subject.player1_won?).to be(true)
      end
    end
  end
end

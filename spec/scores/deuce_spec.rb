# frozen_string_literal: true

require 'scores/deuce'

RSpec.describe Scores::Deuce do
  subject do
    described_class.new(
      player1_points: player1_points,
      player2_points: player2_points,
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  let(:player1_points) { 3 }
  let(:player2_points) { 3 }
  let(:player1_name) { 'Player 1' }
  let(:player2_name) { 'Player 2' }

  context '#victory?' do
    it 'returns false' do
      expect(subject.victory?).to be(false)
    end
  end

  context '#new_game?' do
    it 'returns false' do
      expect(subject.new_game?).to be(false)
    end
  end

  context 'when points are 3 - 3' do
    it 'returns deuce if no scores added to players' do
      expect(subject.score).to eq('Deuce')
    end

    context 'when add point to player 1' do
      it 'returns advantage score class' do
        new_couter = subject.add_point_player1
        expect(new_couter).to be_an_instance_of(Scores::Advantage)
      end
    end

    context 'when add point to player 2' do
      it 'returns advantage score class' do
        new_couter = subject.add_point_player2
        expect(new_couter).to be_an_instance_of(Scores::Advantage)
      end
    end
  end
end

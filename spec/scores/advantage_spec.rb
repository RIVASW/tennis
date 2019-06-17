# frozen_string_literal: true

require 'scores/advantage'

RSpec.describe Scores::Advantage do
  subject do
    described_class.new(
      player1_points: player1_points,
      player2_points: player2_points,
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  let(:player1_points) { 3 }
  let(:player2_points) { 4 }
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

  context 'when points are 3 - 4' do
    it 'returns advantage if no scores added to players' do
      expect(subject.score).to eq("Advantage #{player2_name}")
    end

    context 'when add point to player 1' do
      it 'returns deuce score class' do
        new_couter = subject.add_point_player1
        expect(new_couter).to be_an_instance_of(Scores::Deuce)
      end
    end

    context 'when add point to player 2' do
      it 'returns victory score class' do
        new_couter = subject.add_point_player2
        expect(new_couter).to be_an_instance_of(Scores::Victory)
      end
    end
  end
end

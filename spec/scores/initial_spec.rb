# frozen_string_literal: true

require 'scores/initial'

RSpec.describe Scores::Initial do
  subject do
    described_class.new(
      player1_points: player1_points,
      player2_points: player2_points,
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  let(:player1_points) { 0 }
  let(:player2_points) { 0 }
  let(:player1_name) { 'Player 1' }
  let(:player2_name) { 'Player 2' }

  context '#victory?' do
    it 'returns false' do
      expect(subject.victory?).to be(false)
    end
  end

  context 'when points are 0 - 0' do
    it 'returns 0 - 0 if no scores added to players' do
      expect(subject.score).to eq('0 - 0')
    end

    it 'returns true for new_game?' do
      expect(subject.new_game?).to be(true)
    end

    it 'returns 0 - 15 score and initial score class' do
      new_couter = subject.add_point_player2
      expect(new_couter.score).to eq('0 - 15')
      expect(new_couter).to be_an_instance_of(described_class)
    end
  end

  context 'when points are 0 - 1' do
    let(:player2_points) { 1 }

    it 'returns false for new_game?' do
      expect(subject.new_game?).to be(false)
    end

    it 'returns 0 - 30 score and initial score class' do
      new_couter = subject.add_point_player2
      expect(new_couter.score).to eq('0 - 30')
      expect(new_couter).to be_an_instance_of(described_class)
    end
  end

  context 'when points are 0 - 2' do
    let(:player2_points) { 2 }

    it 'returns 0 - 40 score and initial score class' do
      new_couter = subject.add_point_player2
      expect(new_couter.score).to eq('0 - 40')
      expect(new_couter).to be_an_instance_of(described_class)
    end
  end

  context 'when points are 3 - 2' do
    let(:player1_points) { 3 }
    let(:player2_points) { 2 }

    it 'returns deuce score class' do
      expect(subject.add_point_player2).to be_an_instance_of(Scores::Deuce)
    end
  end

  context 'when points are 0 - 3' do
    let(:player2_points) { 3 }

    it 'returns victory score class' do
      expect(subject.add_point_player2).to be_an_instance_of(Scores::Victory)
    end
  end
end

# frozen_string_literal: true

require 'scores/tie'

RSpec.describe Scores::Tie do
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
      expect(subject.score).to eq('tie-break: 0 - 0')
    end

    it 'returns true for new_game?' do
      expect(subject.new_game?).to be(true)
    end

    it 'returns 0 - 1 score and initial score class' do
      new_couter = subject.add_point_player2
      expect(new_couter.score).to eq('tie-break: 0 - 1')
      expect(new_couter).to be_an_instance_of(described_class)
    end
  end

  context 'when points are 0 - 5' do
    let(:player2_points) { 5 }

    it 'returns false for new_game?' do
      expect(subject.new_game?).to be(false)
    end

    it 'returns 0 - 6 score and initial score class' do
      new_couter = subject.add_point_player2
      expect(new_couter.score).to eq('tie-break: 0 - 6')
      expect(new_couter).to be_an_instance_of(described_class)
    end
  end

  context 'when points are 5 - 6' do
    let(:player1_points) { 5 }
    let(:player2_points) { 6 }

    it 'returns victory score class' do
      expect(subject.add_point_player2).to be_an_instance_of(Scores::Victory)
    end
  end
end

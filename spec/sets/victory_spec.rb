# frozen_string_literal: true

require 'sets/victory'

RSpec.describe Sets::Victory do
  subject do
    described_class.new(
      player1_games: player1_games,
      player2_games: player2_games,
      player1_name: player1_name,
      player2_name: player2_name,
      score_counter: score_counter,
    )
  end

  let(:score_counter) do
    Scores::Initial.new(
      player1_points: player1_points,
      player2_points: player2_points,
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  let(:player1_games) { 6 }
  let(:player2_games) { 7 }
  let(:player1_points) { 0 }
  let(:player2_points) { 0 }
  let(:player1_name) { 'Player 1' }
  let(:player2_name) { 'Player 2' }

  context 'when games are 6 - 7' do
    it 'returns player 2 has won' do
      expect(subject.score).to eq('6 - 7, Player 2 has won!')
    end

    it 'returns player 2 has won and initial set class' do
      new_set = subject.add_point_player1
      expect(new_set.score).to eq('6 - 7, Player 2 has won!')
      expect(new_set).to be_an_instance_of(described_class)
    end
  end

  context 'when games are 7 - 5' do
    let(:player1_games) { 7 }
    let(:player2_games) { 5 }

    it 'returns player 1 has won' do
      expect(subject.score).to eq('7 - 5, Player 1 has won!')
    end

    it 'returns player 1 has won and initial set class' do
      new_set = subject.add_point_player2
      expect(new_set.score).to eq('7 - 5, Player 1 has won!')
      expect(new_set).to be_an_instance_of(described_class)
    end
  end
end

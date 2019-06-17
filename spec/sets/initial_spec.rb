# frozen_string_literal: true

require 'sets/initial'

RSpec.describe Sets::Initial do
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

  let(:player1_games) { 0 }
  let(:player2_games) { 0 }
  let(:player1_points) { 0 }
  let(:player2_points) { 0 }
  let(:player1_name) { 'Player 1' }
  let(:player2_name) { 'Player 2' }

  context 'when games are 0 - 0' do
    context 'when points are 0 - 0' do
      it 'returns games 0 - 0 if no scores added to players' do
        expect(subject.score).to eq('0 - 0')
      end

      it 'returns points 15 - 0 score and initial set class' do
        new_set = subject.add_point_player1
        expect(new_set.score).to eq('0 - 0, 15 - 0')
        expect(new_set).to be_an_instance_of(described_class)
      end
    end

    context 'when points are 15 - 30' do
      let(:player1_points) { 2 }
      let(:player2_points) { 3 }

      it 'returns deuce and initial set class' do
        new_set = subject.add_point_player1
        expect(new_set.score).to eq('0 - 0, Deuce')
        expect(new_set).to be_an_instance_of(described_class)
      end

      it 'returns games 0 - 1 and initial set class' do
        new_set = subject.add_point_player2
        expect(new_set.score).to eq('0 - 1')
        expect(new_set).to be_an_instance_of(described_class)
      end
    end
  end

  context 'when games are 5 - 6' do
    let(:player1_games) { 5 }
    let(:player2_games) { 6 }

    context 'when points are 30 - 0' do
      let(:player1_points) { 3 }
      let(:player2_points) { 0 }

      it 'returns games 6 - 6, initial set class and tie score class' do
        new_set = subject.add_point_player1
        expect(new_set.score).to eq('6 - 6')
        expect(new_set).to be_an_instance_of(described_class)
        expect(new_set.__send__(:score_counter)).to be_an_instance_of(Scores::Tie)
      end
    end
  end

  context 'when games are 6 - 6' do
    let(:player1_games) { 6 }
    let(:player2_games) { 6 }

    let(:score_counter) do
      Scores::Initial.new(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    context 'when points are 5 - 6' do
      let(:player1_points) { 5 }
      let(:player2_points) { 6 }

      it 'returns games 6 - 7 and victory set class' do
        new_set = subject.add_point_player2
        expect(new_set.score).to eq('6 - 7, Player 2 has won!')
        expect(new_set).to be_an_instance_of(Sets::Victory)
      end
    end
  end

  context 'when games are 6 - 5' do
    let(:player1_games) { 6 }
    let(:player2_games) { 5 }

    context 'when points are 5 - 6' do
      let(:player1_points) { 3 }
      let(:player2_points) { 2 }

      it 'returns games 7 - 5 and victory set class' do
        new_set = subject.add_point_player1
        expect(new_set.score).to eq('7 - 5, Player 1 has won!')
        expect(new_set).to be_an_instance_of(Sets::Victory)
      end
    end
  end
end

# frozen_string_literal: true

require 'match'

RSpec.describe Match do
  subject do
    described_class.new(
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  let(:player1_name) { 'Player 1' }
  let(:player2_name) { 'Player 2' }

  context 'when player 1 wins 7 - 5' do
    it 'returns player 1 has won' do
      add_points_player2(4)
      expect(subject.score).to eq('0 - 1')

      add_points_player1(3)
      expect(subject.score).to eq('0 - 1, 40 - 0')

      add_points_player1(16)
      expect(subject.score).to eq('4 - 1, 40 - 0')

      add_points_player2(3)
      expect(subject.score).to eq('4 - 1, Deuce')

      add_points_player2(1)
      expect(subject.score).to eq('4 - 1, Advantage Player 2')

      add_points_player1(3)
      expect(subject.score).to eq('5 - 1')

      add_points_player2(16)
      expect(subject.score).to eq('5 - 5')

      add_points_player1(8)
      expect(subject.score).to eq('7 - 5, Player 1 has won!')

      add_points_player1(2)
      add_points_player2(2)
      expect(subject.score).to eq('7 - 5, Player 1 has won!')
    end
  end

  context 'when player 2 wins 6 - 7' do
    it 'returns player 2 has won' do
      add_points_player2(20)
      expect(subject.score).to eq('0 - 5')

      add_points_player1(23)
      expect(subject.score).to eq('5 - 5, 40 - 0')

      add_points_player1(1)
      expect(subject.score).to eq('6 - 5')

      add_points_player2(9)
      expect(subject.score).to eq('6 - 6, tie-break: 0 - 5')

      add_points_player1(3)
      expect(subject.score).to eq('6 - 6, tie-break: 3 - 5')

      add_points_player2(2)
      expect(subject.score).to eq('6 - 7, Player 2 has won!')

      add_points_player1(2)
      add_points_player2(2)
      expect(subject.score).to eq('6 - 7, Player 2 has won!')
    end
  end

  private

  def add_points_player1(points)
    points.times do
      subject.point_won_by(player1_name)
    end
  end

  def add_points_player2(points)
    points.times do
      subject.point_won_by(player2_name)
    end
  end
end

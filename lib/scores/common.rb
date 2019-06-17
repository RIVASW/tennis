# frozen_string_literal: true

module Scores
  module Common
    MIN_DEUCE_POINTS = 3
    MIN_VICTORY_POINTS = 4
    MIN_TIE_VICTORY_POINTS = 7
    MIN_VICTORY_MARGIN = 2

    def add_point_player1
      self.player1_points += 1
      new_score
    end

    def add_point_player2
      self.player2_points += 1
      new_score
    end

    def new_game?
      player1_points.zero? && player2_points.zero?
    end

    def score
      raise NotImplementedError
    end

    private

    def new_score
      raise NotImplementedError
    end

    def game_won?(min_victory_points:)
      looser_points, winner_points = [player1_points, player2_points].minmax

      winner_points >= min_victory_points && winner_points - looser_points >= MIN_VICTORY_MARGIN
    end

    def deuce?
      player1_points >= MIN_DEUCE_POINTS && player1_points == player2_points
    end

    def advantage_score
      Scores::Advantage.new(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def deuce_score
      Scores::Deuce.new(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def initial_score
      Scores::Initial.new(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def tie_score
      Scores::Tie.new(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def victory_score
      Scores::Victory.new(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end
  end
end

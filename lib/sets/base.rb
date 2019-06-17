# frozen_string_literal: true

require 'scores/initial'
require 'scores/tie'

module Sets
  class Base
    def initialize(
      player1_name:,
      player2_name:,
      player1_games:,
      player2_games:,
      score_counter:
    )
      @player1_name = player1_name
      @player2_name = player2_name
      self.player1_games = player1_games
      self.player2_games = player2_games
      self.score_counter = score_counter
    end

    def add_point_player1
      raise NotImplementedError
    end

    def add_point_player2
      raise NotImplementedError
    end

    def score
      raise NotImplementedError
    end

    protected

    attr_accessor :player1_games, :player2_games, :score_counter
    attr_reader :player1_name, :player2_name

    def initial_set(new_score_counter:)
      Sets::Initial.new(
        player1_name: player1_name,
        player2_name: player2_name,
        player1_games: player1_games,
        player2_games: player2_games,
        score_counter: new_score_counter,
      )
    end

    def victory_set
      Sets::Victory.new(
        player1_name: player1_name,
        player2_name: player2_name,
        player1_games: player1_games,
        player2_games: player2_games,
        score_counter: score_counter,
      )
    end

    def initial_score_counter
      Scores::Initial.new(
        player1_points: 0,
        player2_points: 0,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def tie_score_counter
      Scores::Tie.new(
        player1_points: 0,
        player2_points: 0,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end
  end
end

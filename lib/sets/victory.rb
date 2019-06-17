# frozen_string_literal: true

require 'sets/base'

module Sets
  class Victory < Sets::Base
    def initialize(
      player1_name:,
      player2_name:,
      player1_games:,
      player2_games:,
      score_counter:
    )
      super(
        player1_name: player1_name,
        player2_name: player2_name,
        player1_games: player1_games,
        player2_games: player2_games,
        score_counter: score_counter,
      )
    end

    def add_point_player1
      victory_set
    end

    def add_point_player2
      victory_set
    end

    def score
      "#{player1_games} - #{player2_games}, #{winner} has won!"
    end

    def winner
      if player1_games > player2_games
        player1_name
      else
        player2_name
      end
    end
  end
end

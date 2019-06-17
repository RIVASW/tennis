# frozen_string_literal: true

require 'scores/common'
require 'scores/base'
require 'scores/deuce'
require 'scores/victory'

module Scores
  class Advantage < Scores::Base
    include Scores::Common

    ADVANTAGE = 'Advantage'

    def initialize(player1_points:, player2_points:, player1_name:, player2_name:)
      super(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def score
      name = player_name(player1_name: player1_name, player2_name: player2_name)
      "#{ADVANTAGE} #{name}"
    end

    private

    def player_name(player1_name:, player2_name:)
      if player1_points > player2_points
        player1_name
      else
        player2_name
      end
    end

    def new_score
      if game_won?(min_victory_points: MIN_VICTORY_POINTS)
        victory_score
      else
        deuce_score
      end
    end
  end
end


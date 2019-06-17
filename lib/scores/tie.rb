# frozen_string_literal: true

require 'scores/common'
require 'scores/base'
require 'scores/victory'

module Scores
  class Tie < Scores::Base
    include Scores::Common

    def initialize(player1_points:, player2_points:, player1_name:, player2_name:)
      super(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def score
      "tie-break: #{player1_points} - #{player2_points}"
    end

    private

    def new_score
      if game_won?(min_victory_points: MIN_TIE_VICTORY_POINTS)
        victory_score
      else
        tie_score
      end
    end
  end
end

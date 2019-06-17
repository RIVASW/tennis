# frozen_string_literal: true

require 'scores/base'

module Scores
  class Victory < Scores::Base
    def initialize(player1_points:, player2_points:, player1_name:, player2_name:)
      super(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def victory?
      true
    end

    def player1_won?
      player1_points > player2_points
    end
  end
end

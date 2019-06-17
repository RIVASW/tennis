# frozen_string_literal: true

require 'scores/common'
require 'scores/base'
require 'scores/deuce'
require 'scores/victory'

module Scores
  class Initial < Scores::Base
    include Scores::Common

    POINTS_TO_DISPLAY = [0, 15, 30, 40].freeze

    def initialize(player1_points:, player2_points:, player1_name:, player2_name:)
      super(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def score
      "#{POINTS_TO_DISPLAY[player1_points]} - #{POINTS_TO_DISPLAY[player2_points]}"
    end

    private

    def new_score
      if game_won?(min_victory_points: MIN_VICTORY_POINTS)
        victory_score
      elsif deuce?
        deuce_score
      else
        initial_score
      end
    end
  end
end

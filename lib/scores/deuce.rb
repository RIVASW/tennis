# frozen_string_literal: true

require 'scores/common'
require 'scores/base'
require 'scores/advantage'

module Scores
  class Deuce < Scores::Base
    include Scores::Common

    DEUCE = 'Deuce'

    def initialize(player1_points:, player2_points:, player1_name:, player2_name:)
      super(
        player1_points: player1_points,
        player2_points: player2_points,
        player1_name: player1_name,
        player2_name: player2_name,
      )
    end

    def score
      DEUCE
    end

    private

    def new_score
      advantage_score
    end
  end
end

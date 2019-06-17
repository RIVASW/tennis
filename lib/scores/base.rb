# frozen_string_literal: true

module Scores
  class Base
    def initialize(player1_points:, player2_points:, player1_name:, player2_name:)
      self.player1_points = player1_points
      self.player2_points = player2_points
      @player1_name = player1_name
      @player2_name = player2_name
    end

    def victory?
      false
    end

    protected

    attr_accessor :player1_points, :player2_points
    attr_reader :player1_name, :player2_name
  end
end

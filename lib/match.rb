# frozen_string_literal: true

require 'sets/initial'

class Match
  def initialize(player1_name:, player2_name:)
    @player1_name = player1_name
    @player2_name = player2_name
    self.set = Sets::Initial.new(
      player1_name: player1_name,
      player2_name: player2_name,
    )
  end

  def point_won_by(name)
    if player1_name == name
      self.set = set.add_point_player1
    elsif player2_name == name
      self.set = set.add_point_player2
    end
  end

  def score
    set.score
  end

  private

  attr_accessor :set
  attr_reader :player1_name, :player2_name
end

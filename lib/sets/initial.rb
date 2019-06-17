# frozen_string_literal: true

require 'sets/base'
require 'sets/victory'

module Sets
  class Initial < Sets::Base
    MIN_VICTORY_GAMES = 6
    TIE_VICTORY_GAMES = 7
    MIN_VICTORY_MARGIN = 2
    TIE_GAMES = 6

    def initialize(
      player1_name:,
      player2_name:,
      player1_games: 0,
      player2_games: 0,
      score_counter: nil
    )
      super(
        player1_name: player1_name,
        player2_name: player2_name,
        player1_games: player1_games,
        player2_games: player2_games,
        score_counter: score_counter || initial_score_counter,
      )
    end

    def add_point_player1
      self.score_counter = score_counter.add_point_player1
      new_set
    end

    def add_point_player2
      self.score_counter = score_counter.add_point_player2
      new_set
    end

    def score
      games_score = "#{player1_games} - #{player2_games}"
      if score_counter.new_game?
        games_score
      else
        "#{games_score}, #{score_counter.score}"
      end
    end

    private

    def new_set
      if score_counter.victory?
        update_player_games
        if set_won?
          victory_set
        elsif tie?
          initial_set(new_score_counter: tie_score_counter)
        else
          initial_set(new_score_counter: initial_score_counter)
        end
      else
        initial_set(new_score_counter: score_counter)
      end
    end

    def update_player_games
      if score_counter.player1_won?
        self.player1_games += 1
      else
        self.player2_games += 1
      end
    end

    def set_won?
      looser_games, winner_games = [player1_games, player2_games].minmax

      (winner_games >= MIN_VICTORY_GAMES && winner_games - looser_games >= MIN_VICTORY_MARGIN) ||
        winner_games == TIE_VICTORY_GAMES
    end

    def tie?
      player1_games == TIE_GAMES && player2_games == TIE_GAMES
    end
  end
end

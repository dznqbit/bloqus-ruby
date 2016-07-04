module Bloqus
  # Represents state of a game.
  class Game
    attr_reader :players
    attr_reader :board

    def initialize(players:, piece_set:, board:)
    end

    def available_pieces(player)
    end

    def current_player
    end

    private

    # Blue, Yellow, Red, Green
  end
end

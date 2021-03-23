require_relative "piece.rb"

class NullPiece < Piece

    include Singleton

    def initialize
        @color = nil
        @symbol = nil
    end

end
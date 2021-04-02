require_relative "piece.rb"
require "singleton"

class NullPiece < Piece

    include Singleton

    attr_reader :color, :symbol

    def initialize
        @color = "purple"
        @symbol = " "
    end


    def dup(l)
        self
    end

    def valid_moves
        []
    end

end
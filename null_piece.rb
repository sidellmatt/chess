require_relative "piece.rb"
require "singleton"

class NullPiece < Piece

    include Singleton

    attr_reader :color, :symbol

    def initialize
        @color = "purple"
        @symbol = "_"
    end


    def dup(l)
        self
    end

end
require_relative "slideable_module.rb"

class Rook < Piece

    include Slideable

    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "R"
    end

    def move_dirs
        return [[0, -1], [0, 1], [1, 0], [-1, 0]]
    end

end
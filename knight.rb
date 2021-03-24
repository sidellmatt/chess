require_relative "stepable_module.rb"

class Knight < Piece

    include Stepable

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = "H"
        super(color, board, pos)
    end

    def move_dirs
        return [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [2, -1], [2, 1], [1, -2], [1, 2]]
    end

end
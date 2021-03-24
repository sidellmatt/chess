require_relative "stepable_module.rb"

class King < Piece

    include Stepable

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = "K"
        super(color, board, pos)
    end

    def move_dirs
        return [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    end

end
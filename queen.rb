require_relative "slideable_module.rb"

class Queen < Piece

    include Slideable

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = "Q"
        super(color, board, pos)
    end

    def move_dirs
        return [[-1, -1], [-1, 1], [1, -1], [1, 1], [0, -1], [0, 1], [1, 0], [-1, 0]]
    end

end
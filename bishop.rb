require_relative "slideable_module.rb"

class Bishop < Piece

    include Slideable

    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "B"
    end

    def move_dirs
        return [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    end

end
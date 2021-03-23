class Piece

    attr_accessor :pos
    attr_reader :color, :symbol
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @symbol = "P"
    end


    def moves
        # return array of positions piece can move to 
    end

end
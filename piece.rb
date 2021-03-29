class Piece

    attr_accessor :pos
    attr_reader :color, :symbol, :board
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @symbol = "P"
    end


    def moves 
    end

end
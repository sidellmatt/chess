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
        []
    end


    def dup(new_board)
        new_piece = self.class.new(self.color, new_board, self.pos.dup)
    end


    def valid_moves
        moves.reject { |ele| move_into_check?(ele) }
    end


    def move_into_check?(end_pos)
        x, y = end_pos[0], end_pos[1]
        new_board = self.board.deep_dup
        new_board.move_piece!(self.pos, [x, y])
        new_board.in_check?(self.color)
    end

end
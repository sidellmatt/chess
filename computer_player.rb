class ComputerPlayer

    attr_reader :color
    
    def initialize(color, display)
        @color = color
        @display = display
    end


    def make_move(board)
        my_pieces = board.pieces(self.color)
        a  = my_pieces.sample
        
        while a.valid_moves.empty?
            a = my_pieces.sample
        end
        
        b = a.valid_moves.sample
        [a.pos, b]
    end

end
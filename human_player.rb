class HumanPlayer

    def initialize(color, display)
        @color = color
        @display = display
    end


    def make_move(board)
        move = @display.cursor.get_input
        return move if move
    end

end
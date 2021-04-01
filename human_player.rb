class HumanPlayer

    attr_reader :color, :display
    
    def initialize(color, display)
        @color = color
        @display = display
    end


    def make_move(board)
        start_pos = @display.cursor.get_input
        end_pos = @display.cursor.get_input
        return [start_pos, end_pos]
    end

end
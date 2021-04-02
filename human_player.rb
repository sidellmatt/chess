class HumanPlayer

    attr_reader :color, :display
    
    def initialize(color, display)
        @color = color
        @display = display
    end


    def make_move(board)
        start_pos = nil
        end_pos = nil
        while !start_pos
            @display.render
            start_pos = @display.cursor.get_input
        end
        while !end_pos
            end_pos = @display.cursor.get_input
        end
        return [start_pos, end_pos]
    end

end
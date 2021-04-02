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
            system("clear")
            @display.render
            start_pos = @display.cursor.get_input
        end
        @display.selected = start_pos
        while !end_pos
            system("clear")
            @display.render
            end_pos = @display.cursor.get_input
        end
        @display.selected = nil
        return [start_pos, end_pos]
    end

end
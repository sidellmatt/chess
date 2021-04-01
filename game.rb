require_relative "board.rb"
require_relative "human_player.rb"
require_relative "display.rb"

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player_1 = HumanPlayer.new(:white, @display)
        @player_2 = HumanPlayer.new(:black, @display)
        @current_player = @player_1
    end


    def switch_turn
        if @current_player == player_1
            @current_player = player_2
        else
            @current_player = player_1
        end
    end


    def play
        until @board.checkmate?(:white) || @board.checkmate?(:black)
            @display.render
            @current_player.make_move(@board)
        end
    end

end
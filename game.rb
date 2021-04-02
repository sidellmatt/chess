require_relative "board.rb"
require_relative "human_player.rb"
require_relative "display.rb"
require_relative "computer_player.rb"

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player_1 = ComputerPlayer.new(:white, @display)
        @player_2 = HumanPlayer.new(:black, @display)
        @current_player = @player_1
    end


    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end


    def stalemate?
        @board.has_moves?(@current_player.color)
    end


    def game_over?
        @board.checkmate?(:white) || @board.checkmate?(:black) || self.stalemate?
    end


    def play
        until self.game_over?
            begin
                @display.render
                move = @current_player.make_move(@board)
                color = @current_player.color
                @board.move_piece(color, move[0], move[1])
            rescue MoveError => e
                retry
            else
                self.switch_turn
            end
        end
        if @board.checkmate?(:white) || @board.checkmate?(:black)
            puts "Checkmate! "
        elsif self.stalemate?
            puts "Stalemate! "
        end
    end

end


game = Game.new
game.play
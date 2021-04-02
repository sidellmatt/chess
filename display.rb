require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"
require "byebug"

class Display

    attr_accessor :selected
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @selected = nil
    end

    def render
        (0...board.rows.length).each do |row_idx|
            (0...board.rows.length).each do |col_idx|
                piece = board[[row_idx, col_idx]]
                background = nil
                if (row_idx + col_idx) % 2 == 0
                    background = :light_cyan
                else
                    background = :light_black
                end

                if [row_idx, col_idx] == @selected
                    print (" " + piece.symbol + " ").colorize(color: :magenta, background: background)
                elsif [row_idx, col_idx] == @cursor.cursor_pos
                    print (" " + piece.symbol + " ").colorize(color: piece.color, background: :light_red)
                elsif @selected && @board[selected].valid_moves.include?([row_idx, col_idx])
                    print (" " + piece.symbol + " ").colorize(color: piece.color, background: :magenta)
                else
                    print (" " + piece.symbol + " ").colorize(color: piece.color, background: background)
                end
            end
            puts
        end
    end

end
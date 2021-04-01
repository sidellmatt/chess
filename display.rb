require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"
require "byebug"

class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        (0...board.rows.length).each do |row_idx|
            print "|"
            (0...board.rows.length).each do |col_idx|
                piece = board[[row_idx, col_idx]]
                if [row_idx, col_idx] == @cursor.cursor_pos
                    print piece.symbol.colorize(:red) + "|"
                else
                    print piece.symbol.colorize(piece.color) + "|"
                end
            end
            puts
        end
    end

end
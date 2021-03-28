require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"

class Display

    attr_reader :board

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        (0...board.rows.length).each do |row_idx|
            (0...board.rows.length).each do |col_idx|
                if board.rows[row_idx][col_idx].pos == @cursor_pos
                    p board.rows[row_idx][col_idx].symbol.colorize(:blue)
                else
                    p board.rows[row_idx][col_idx].symbol
                end
            end
        end
    end

end


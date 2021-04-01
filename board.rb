require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require "byebug"

class Board

    attr_accessor :rows
    
    def initialize(setup = true)
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.instance
        self.setup_pieces if setup
    end


    def setup_pieces
        (0...rows.length).each do |row|
            if row == 0
                (0...rows.length).each do |col|
                    if col == 0 || col == 7
                        @rows[row][col] = Rook.new(:white, self, [row, col])
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new(:white, self, [row, col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new(:white, self, [row, col])
                    elsif col == 3
                        @rows[row][col] = King.new(:white, self, [row, col])
                    elsif col == 4
                        @rows[row][col] = Queen.new(:white, self, [row, col])
                    end
                end
            elsif row == 1
                (0...rows.length).each do |col|
                    @rows[row][col] = Pawn.new(:white, self, [row, col])
                end
            elsif row == 6
                (0...rows.length).each do |col|
                    @rows[row][col] = Pawn.new(:black, self, [row, col])
                end
            elsif row == 7
                (0...rows.length).each do |col|
                    if col == 0 || col == 7
                        @rows[row][col] = Rook.new(:black, self, [row, col])
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new(:black, self, [row, col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new(:black, self, [row, col])
                    elsif col == 3
                        @rows[row][col] = King.new(:black, self, [row, col])
                    elsif col == 4
                        @rows[row][col] = Queen.new(:black, self, [row, col])
                    end
                end
            else
                (0...rows.length).each do |col|
                    @rows[row][col] = @null_piece
                end 
            end
        end
    end


    def [](pos)
        x, y = pos[0], pos[1]
        @rows[x][y]
    end


    def []=(pos, val)
        x, y = pos[0], pos[1]
        @rows[x][y] = val
    end


    def valid_pos?(pos)
        return false if !(0...rows.length).include?(pos[0])
        return false if !(0...rows.length).include?(pos[1])
        true
    end


    def move_piece(color, start_pos, end_pos)
        x, y = start_pos[0], start_pos[1]
        x2, y2 = end_pos[0], end_pos[1]
        if self[[x,y]].color != color
            raise ArgumentError.new "No piece at start pos"
        end
        if self[[x2,y2]].color != "purple"
            raise ArgumentError.new "Cannot move there" 
        end
        piece = self[[x,y]]
        self[[x2,y2]] = piece
        self[[x,y]] = @null_piece
        piece.pos = [x2, y2]
    end


    def in_check?(color)
        opposite = ""
        if color == :white
            opposite = :black
        elsif color == :black
            opposite = :white
        end
        king_pos = nil
        (0...rows.length).each do |row_idx|
            (0...rows.length).each do |col_idx|
                king_pos = [row_idx, col_idx] if self[[row_idx, col_idx]].symbol == "K" && self[[row_idx, col_idx]].color == color
            end
        end

        (0...rows.length).each do |row_index|
            (0...rows.length).each do |col_index|
                if rows[row_index][col_index].color == opposite && rows[row_index][col_index].moves.include?(king_pos)
                    return true
                end
            end
        end

        false

    end


    def checkmate?(color)
        if in_check?(color)
            if self.pieces(color).any? { |piece| piece.valid_moves.length > 0 }
                return false
            end
            return true
        end
        false
    end


    def deep_dup
        new_board = Board.new(false)
        (0...8).each do |row|
            (0...8).each do |col|
                piece = self[[row, col]]
                new_board[[row, col]] = piece.dup(new_board)
            end
        end
        new_board
    end


    def pieces(color)
        self.rows.flatten.select { |el| el.color == color }
    end

end

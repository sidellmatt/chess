require_relative "piece.rb"
require_relative "null_piece.rb"

class Board

    attr_accessor :rows
    
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        self.setup_pieces
    end


    def setup_pieces
        (0...rows.length).each do |row|
            if row <= 1 || row >= 6
                (0...rows.length).each do |col|
                    @rows[row][col] = Piece.new("white", self, [row, col])
                end
            else
                (0...rows.length).each do |col|
                    @rows[row][col] = NullPiece.instance
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


    def move_piece(start_pos, end_pos)
        x, y = start_pos[0], start_pos[1]
        x2, y2 = end_pos[0], end_pos[1]
        if self[[x,y]].nil?
            raise ArgumentError.new "No piece at start pos"
        end
        if !self[[x2,y2]].nil?
            raise ArgumentError.new "Cannot move there" 
        end
        piece = self[[x,y]]
        self[[x2,y2]] = piece
        self[[x,y]] = NullPiece.instance
        piece.pos = [x2, y2]
    end

end

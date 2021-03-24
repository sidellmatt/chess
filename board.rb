require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "king.rb"

class Board

    attr_accessor :rows
    
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.instance
        self.setup_pieces
    end


    def setup_pieces
        (0...rows.length).each do |row|
            if row == 0
                (0...rows.length).each do |col|
                    if col == 0 || col == 7
                        @rows[row][col] = Rook.new("white", self, [row, col])
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new("white", self, [row, col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new("white", self, [row, col])
                    elsif col == 3
                        @rows[row][col] = King.new("white", self, [row, col])
                    elsif col == 4
                        @rows[row][col] = Queen.new("white", self, [row, col])
                    end
                end
            elsif row == 1
                (0...rows.length).each do |col|
                    @rows[row][col] = Piece.new("white", self, [row, col]) #Pawns
                end
            elsif row == 6
                (0...rows.length).each do |col|
                    @rows[row][col] = Piece.new("black", self, [row, col]) #Pawns
                end
            elsif row == 7
                (0...rows.length).each do |col|
                    if col == 0 || col == 7
                        @rows[row][col] = Rook.new("black", self, [row, col])
                    elsif col == 1 || col == 6
                        @rows[row][col] = Knight.new("black", self, [row, col])
                    elsif col == 2 || col == 5
                        @rows[row][col] = Bishop.new("black", self, [row, col])
                    elsif col == 3
                        @rows[row][col] = King.new("black", self, [row, col])
                    elsif col == 4
                        @rows[row][col] = Queen.new("black", self, [row, col])
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


    def move_piece(start_pos, end_pos)  # (also take color as an argument)
        x, y = start_pos[0], start_pos[1]
        x2, y2 = end_pos[0], end_pos[1]
        if self[[x,y]].symbol == nil
            raise ArgumentError.new "No piece at start pos"
        end
        if self[[x2,y2]].color != nil
            raise ArgumentError.new "Cannot move there" 
        end
        piece = self[[x,y]]
        self[[x2,y2]] = piece
        self[[x,y]] = @null_piece
        piece.pos = [x2, y2]
    end

end

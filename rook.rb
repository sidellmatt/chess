class Rook < Piece

    include Slideable

    def move_dirs
        return [[0, -1], [0, 1], [1, 0], [-1, 0]]
    end

end
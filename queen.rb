class Queen < Piece

    include Slideable

    def move_dirs
        return [[-1, -1], [-1, 1], [1, -1], [1, 1], [0, -1], [0, 1], [1, 0], [-1, 0]]
    end

end
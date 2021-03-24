require_relative "stepable_module.rb"

class King < Piece

    include Stepable

    def move_dirs
        return [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    end

end
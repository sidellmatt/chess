require_relative "slideable_module.rb"

class Bishop < Piece

    include Slideable

    def move_dirs
        return [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    end

end
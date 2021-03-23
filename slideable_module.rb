module Slideable

    def moves
        moves_arr = []
        move_dirs.each do |direction|
            x, y = direction[0], direction[1]
            new_x = self.pos[0] + x
            new_y = self.pos[1] + y
            moves_arr << [new_x, new_y]
        end
        moves_arr
    end

end
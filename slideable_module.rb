module Slideable

    def moves
        moves_arr = []
        move_dirs.each do |direction|
            x, y = direction[0], direction[1]
            new_x = self.pos[0] + x
            new_y = self.pos[1] + y
            blocked = false
            until blocked || !self.board.valid_pos?([new_x, new_y])
                blocked = true if !self.board.valid_pos?([new_x, new_y])
                blocked = true if self.board.rows[new_x][new_y].color == self.color
                moves_arr << [new_x, new_y] unless blocked
                blocked = true if self.board.rows[new_x][new_y].color != self.color && self.board.rows[new_x][new_y].color != "purple"
                new_x += x
                new_y += y
            end
        end
        moves_arr
    end

end
class Pawn < Piece

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = "P"
        super(color, board, pos)
    end

    def forward_dir
        if self.color == "white"
            return 1
        elsif self.color == "black"
            return -1
        end
    end
    
    def at_start_row?
        if self.color == "white"
            return true if self.pos[0] == 1
            false
        elsif self.color == "black"
            return true if self.pos[0] == 6
            false
        end
    end

    def forward_steps
        steps = []
        if self.board.valid_pos?([[self.pos[0] + self.forward_dir, self.pos[1]]])
            if self.board.rows[self.pos[0] + self.forward_dir][self.pos[1]].color == nil
                steps << [self.pos[0] + self.forward_dir, self.pos[1]]
            end
        end
        if self.at_start_row?
            steps << [self.pos[0] + (self.forward_dir * 2), self.pos[1]] if self.board.rows[self.pos[0] + (self.forward_dir * 2)][self.pos[1]].color == nil
        end
        steps
    end

    def side_attacks
        attacks = []
        if self.color == "white"
            if self.board.rows[self.pos[0] + self.forward_dir][self.pos[1] - 1].color == "black"
                attacks << [self.pos[0] + self.forward_dir][self.pos[1] - 1]
            end
            if self.board.rows[self.pos[0] + self.forward_dir][self.pos[1] + 1].color == "black"
                 attacks << [self.pos[0] + self.forward_dir][self.pos[1] + 1]
            end
        elsif self.color == "black"
            if self.board.rows[self.pos[0] + self.forward_dir][self.pos[1] - 1].color == "white"
                attacks << [self.pos[0] + self.forward_dir][self.pos[1] - 1]
            end
            if self.board.rows[self.pos[0] + self.forward_dir][self.pos[1] + 1].color == "white"
                 attacks << [self.pos[0] + self.forward_dir][self.pos[1] + 1]
            end
        end
        attacks
    end

    def moves
        return self.forward_steps + self.side_attacks
    end

end
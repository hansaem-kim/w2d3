class Board
    attr_reader :grid

    def initialize(n)
        @n = n
        @grid = Array.new(n) {Array.new(n)}
        (0...n).each do |i|
            (0...n).each do |j|
                @grid[i][j] = "_"
            end
        end
    end

    def valid?(position)
        return true if (position[0] < @n && position[1] < @n) && (position[0] > -1 && position[1] > -2)
        false
    end

    def empty?(position)
        return true if @grid[position[0]][position[1]]=="_"
        false
    end

    def place_mark(position, mark)
        if !self.empty?(position) || !self.valid?(position)
            raise "invalid position"
        else
            @grid[position[0]][position[1]] = mark 
        end
    end

    def print
        @grid.each do |row|
            puts row.map {|ele| ele}.join(" | ")
        end
        return "Tic-Tac-Toe"
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? {|ele| ele == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        transposed = @grid.transpose
        transposed.each do |row|
            if row.all? {|ele| ele == mark}
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        if (0...@n).all? {|i| @grid[i][i] == mark}
            return true
        elsif (0...@n).all? {|i| @grid[i][@n-1-i] == mark}
            return true
        end
        false
    end

    def win?(mark)
        (self.win_row?(mark) || self.win_col?(mark)) || self.win_diagonal?(mark)
    end

    def empty_positions?
        (0...@n).each do |i|
            (0...@n).each do |j|
                return true if @grid[i][j] == "_"
            end
        end
        false
    end

end




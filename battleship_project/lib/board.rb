class Board
    attr_reader :size
    def initialize(n)
        @n = n
        @grid = Array.new(n){Array.new(n)}
        @size = n*n
        (0...n).each do |i|
            (0...n).each do |j|
                @grid[i][j] = :N
            end
        end
    end

    def [](indicies)
        @grid[indicies[0]][indicies[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.flatten.each do |ele|
            count +=1 if ele == :S
        end
        count
    end

    def attack(position)
        if self[position] == :S 
            self[position] = :H 
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X 
            return false
        end
    end

    def place_random_ships
        while self.num_ships < @size/4.to_f
            i = rand(@n-1)
            j = rand(@n-1)
            self[[i,j]] = :S 
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@n) {Array.new(@n)}
        (0...@n).each do |i|
            (0...@n).each do |j|
                if @grid[i][j] == :S 
                    hidden_grid[i][j] = :N
                else
                    hidden_grid[i][j] = @grid[i][j]
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts "#{(row.map {|ele| ele}).join(" ")}"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print 
        Board.print_grid(self.hidden_ships_grid)
    end

end

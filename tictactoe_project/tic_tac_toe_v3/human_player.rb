class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        valid = false
        while !valid
            puts "Enter you position 'x y' with space: "
            position = gets.chomp.split
            position.map! {|ele| ele.to_i}
            if !legal_positions.include?(position)
                puts "It's not a legal position"
            else
                break
            end
        end
        return position
    end

end
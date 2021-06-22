class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Enter you position 'x y' with space: "
        position = gets.chomp.split
        raise "You didn't enter correctly" if position.length !=2 || (("A".."z").include?(position[0]) || ("A".."z").include?(position[1]))
        position.map! {|ele| ele.to_i}
        return position
    end

end
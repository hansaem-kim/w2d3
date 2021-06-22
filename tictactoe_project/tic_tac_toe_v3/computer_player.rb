class ComputerPlayer

    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Computer's Turn"
        return legal_positions.sample
    end
end
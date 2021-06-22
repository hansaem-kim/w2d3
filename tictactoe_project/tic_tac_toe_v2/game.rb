require_relative "board"
require_relative "human_player"

class Game

    def initialize(n, *marks)
        @players = []
        (0...marks.length).each do |i|
            @players << HumanPlayer.new(marks[i])
        end
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                return "#{@current_player.mark} won!"
            else
                self.switch_turn
            end
        end
        return "draw"
    end
end



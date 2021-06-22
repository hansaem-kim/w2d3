require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game

    def initialize(n, hash)
        @players = []
        hash.each do |k,v|
            if v
                @players << ComputerPlayer.new(k)
            else
                @players << HumanPlayer.new(k)
            end
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
            position = @current_player.get_position(@board.legal_positions)
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



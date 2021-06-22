require_relative "code"


class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        puts "Exact Matches: " + @secret_code.num_exact_matches(code).to_s
        puts "Near Matches: " + @secret_code.num_near_matches(code).to_s
    end

    def ask_user_for_guess
        puts "Enter a code: "
        input = gets.chomp
        code = Code.from_string(input)
        self.print_matches(code)
        code = Code.from_string(input)
        code == @secret_code
    end

end

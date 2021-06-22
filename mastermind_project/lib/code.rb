class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(a)
    return true if a.all? {|ele| POSSIBLE_PEGS.has_key?(ele.upcase)}
    false
  end

  def initialize(a)
    if !Code.valid_pegs?(a)
      raise "not valid pegs"
    else
      @pegs = a
      @pegs.map! do |ele|
        ele.upcase
      end
    end
  end

  def self.random(length)
    a = []
    while a.length < length
      a << POSSIBLE_PEGS.keys.sample
    end
    Code.new(a)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count=0
    i=0
    while i < self.length
      count +=1 if @pegs[i] == code.pegs[i]
      i+=1
    end
    count
  end

  def num_near_matches(code)
    count1 = 0
    count2 = 0
    @pegs.each.with_index do |color, i|
      if color == code.pegs[i]
        code.pegs[i] = nil
      elsif code.pegs.include?(color)
        count1 +=1
      end
    end
    code.pegs.each.with_index do |color, i|
      if @pegs.include?(color)
        count2 +=1
      end
    end
    [count1,count2].min
  end

  def ==(code)
    @pegs == code.pegs
  end
end

class Array
  def my_uniq
    output = []
    self.each do |el|
      output << el unless output.include?(el)
    end

    output
  end

  def two_sum
    pairs = []
    self.each_index do |i|
      (i+1...self.length).each do |j|
        if self[i] + self[j] == 0
          pairs << [i, j]
        end
      end
    end
    pairs
  end

  def my_transpose
    tranposed = Array.new(self.length) {Array.new(self.length)}
    self.each_index do |row|
      self[row].each_index do |col|
        tranposed[col][row] = self[row][col]
      end
    end
    tranposed
  end

  def stock_picker
    days = [0, 1]
    max_profit = self[1] - self[0]

    self.each_with_index do |price, day|
      (day+1).upto(self.length-1) do |day2|
        if self[day2] - price > max_profit
          max_profit = self[day2] - price
          days = [day, day2]
        end   
      end
    end

    days
  end

end

class Towers
  attr_reader :towers

  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(from, to)
    towers[to].push(towers[from].pop) if valid_move?(from, to)
  end

  def won?
    towers[1].length == 3 || towers[2].length == 3
  end

  def get_input
    gets.chomp.split(",").map(&:to_i)
  end

  def play
    until won?
      render
      pos = get_input
      move(pos[0], pos[1])
    end
    puts "You win!"
  end

  def render
    puts towers.inspect
  end

  private
  def valid_move?(from, to)
    return false if towers[from].empty?
    return true if towers[to].empty?
    return false if towers[from][-1] > towers[to][-1]
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Towers.new
  game.play

end
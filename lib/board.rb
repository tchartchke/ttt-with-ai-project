class Board
  attr_accessor :cells

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(pos)
    self.cells[pos.to_i-1]
  end

  def full?
    !self.cells.any?(" ")
  end

  def turn_count
    self.cells.count{ |cell| cell != " "}
  end

  def taken?(pos)
    self.cells[pos.to_i-1] != " "
  end

  def valid_move?(pos)
    !taken?(pos) && pos.to_i.between?(1,9)
  end

  def update(pos, player)
    self.cells[pos.to_i-1] = player.token
  end
  
end
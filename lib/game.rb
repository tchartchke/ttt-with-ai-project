class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2] ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      first_pos = self.board.cells[combo[0]]
      second_pos = self.board.cells[combo[1]]
      third_pos = self.board.cells[combo[2]]
      return combo if (first_pos == second_pos && first_pos == third_pos && first_pos != " ")
    end
    false
  end

  def draw?
    !won? && self.board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    win_combo = won?
    win_combo ? self.board.cells[win_combo[0]] : nil
  end

  def turn
    player_input = current_player.move(self.board)
    until self.board.valid_move?(player_input) do
      puts "Invalid move. Please try again with a value 1 through 9 "
      player_input = current_player.move(self.board)
    end
    self.board.update(player_input, current_player)
    self.board.display
    puts ""
  end

  def play
    until over? do
      puts "It's #{current_player.token}'s turn."
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def start
    puts "The board is currently empty"
    self.board.display
    puts ""
    play
  end
end

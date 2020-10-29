module Players 
  class Computer < Player
    attr_accessor :available_moves
    def initialize(token)
      super
      @available_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].shuffle
    end

    def move(board)
      go = self.available_moves.pop
      until board.valid_move?(go) do
        go = self.available_moves.pop
      end
      puts "#{self.token} goes in #{go}"
      go
    end

  end 
end
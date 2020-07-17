class Game
  attr_accessor :board, :player_1, :player_2, :user_input
  
  WIN_COMBINATIONS = [
    [0,1,2], # Top row 
    [3,4,5], # Middle row 
    [6,7,8], # Bottom row 
    [0,3,6], # left column 
    [1,4,7], # middle column 
    [2,5,8], # right column 
    [0,4,8], # diag topleft 
    [2,4,6]  # diag botleft
  ]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new) 
    @player_1 = player_1 
    @player_2 = player_2
    @board = board    
  end
  
  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    # returns false for a draw
    # returns the correct winning combination in the case of a win
    WIN_COMBINATIONS.each do |win_combo|
      if (self.board.cells[win_combo[0]] == "X" && self.board.cells[win_combo[1]] == "X" && self.board.cells[win_combo[2]] == "X") || (self.board.cells[win_combo[0]] == "O" && self.board.cells[win_combo[1]] == "O" && self.board.cells[win_combo[2]] == "O")
      return win_combo 
      end
    end
    false
  end
  
  def draw?
    if self.board.full? == true && self.won? == false
      true
    else
      false
    end
  end
  
  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end 
  
  def winner
    winning_combo = self.won?
    if winning_combo
      self.board.cells[winning_combo[0]]
    else 
      nil
    end
  end
  
  def turn
    # makes valid moves
    # asks for input again after a failed validation
    # changes to player 2 after the first turn
    
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if self.board.valid_move?(@user_input)
      self.board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end
  
  def play
    # asks for players input on a turn of the game
    # checks if the game is over after every turn
    # plays the first turn of the game, first few turns of the game
    # checks if the game is won after every turn
    # checks if the game is a draw after every turn
    # stops playing if someone has won
    # congratulates the winner X, winner O
    # stops plaing in a draw
    # prints "Cat's Game!" on a draw
    # plays through an entire game
    
    turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end
  
  
end
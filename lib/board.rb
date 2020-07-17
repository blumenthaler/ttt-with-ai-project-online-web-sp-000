class Board
  attr_accessor :cells
  
  @cells = []

  def initialize
    # should start with cells for new game of TTT
        # use #reset! 
    self.reset!
  end
  
  def reset!
    # resets state of cells to empty game board
    self.cells = Array.new(9, " ")
  end
  
 def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    # takes in user input via strings ("2", "9", etc 1-9)
    # looks up value of cells at correct index from array
    
    self.cells[input.to_i-1]     
  end
  
  def full?
    # returns true for a full board
    # returns false for an in-progress game
    
     self.cells.all? do |index|
      if index == "X" || index == "O"
        true
      else
        false
      end
    end
  end
  
  def turn_count
    # returns the amount of turns based on cell value
    
    array_of_taken_positions = []
    self.cells.each do |index|
      if index == "O" || index == "X"
        array_of_taken_positions << index
      end
    end
    array_of_taken_positions.size
  end
  
  def taken?(input)
    # returns true if the position is X or O
    # returns false if the position is empty or blank
    
    position = input.to_i-1
    if self.cells[position] == "X" || self.cells[position] == "O"
      true
    elsif self.cells[position] == " " || self.cells[position] == "" || self.cells[position] == nil
      false
    end
  end
  
  def valid_move?(input)
    # returns true for user input between 1-9 that is not taken
    
    !taken?(input) && input.to_i > 0 && input.to_i <= 9
  end
  
  def update(position, player)
    # updates the cells in the board with the player token according to the input
    
    self.cells[position.to_i-1] = player.token
  end
  
  
end
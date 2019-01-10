
class Game

  def initialize(grid)
    @grid = grid
  end

  def is_finished
    @grid.is_full || @grid.one_side_wins
  end

  def game_rules_display
    puts "please enter a number where you would like to insert a Cross"
    puts "  0  | 1 | 2 \n ---+---+---\n  3  | 4 | 5   \n ---+---+--- \n  6  | 7 | 8  "
  end

  def play
    $stdin.gets
    puts "output message"
  end


end
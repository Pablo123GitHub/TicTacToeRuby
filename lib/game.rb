
class Game

  def initialize (grid)
    @grid = grid.new
  end

  def start
    puts "select a number between 0 and 8 \nthen press Enter"
  end

  def is_finished
    @grid.is_full
  end


end
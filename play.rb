require_relative('./lib/grid')

grid = Grid.new()

while true
  puts "select a number between 0 and 8\n"
  puts " and press Enter"

  input_player = gets
  grid.records(input_player, "X")
  puts grid.display_grid()
end





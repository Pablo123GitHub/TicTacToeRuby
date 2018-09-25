require_relative('./lib/grid')

grid = Grid.new()

# puts grid.display_grid()

# grid.records(2,"X")

grid.records(0,"O")

grid.records(3,"X")

grid.records(1,"O")

grid.records(4,"X")

grid.records(6,"O")

grid.records(7,"X")

grid.records(2,"O")

grid.records(5,"X")
grid.records(8,"O")

puts grid.display_grid()

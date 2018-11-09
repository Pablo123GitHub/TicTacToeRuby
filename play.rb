require_relative('./lib/grid')
require_relative('./lib/game')

grid = Grid.new()
game = Game.new(grid)

game.game_rules_display

while !game.is_finished


end

#
# while true
#   input_player = gets
#   grid.records(input_player, "X")
#   puts grid.display_grid()
# end





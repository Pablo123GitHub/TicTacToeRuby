require('game')

describe Game do

  context "gives intructions about how to play the game" do

    it "tells the human player to start the game" do
      grid = double("grid")
      grid.stub(:new)
      game = Game.new(grid)
      expect(STDOUT).to receive(:puts).with("select a number between 0 and 8 \nthen press Enter")
      game.start
    end
  end

  context "tracks events throughout the game" do
    it "tells the game is NOT finished if grid is NOT full and no one wins yet" do
      grid = double("grid")
      grid.stub(:new)
      @grid.stub(:is_full).and_return(false)
      @grid.stub(:one_side_wins).and_return(false)
      game = Game.new(grid)
      expect(game.is_finished).to eq(false)
    end
    it "tells the game is finished if grid is NOT full and One side wins" do
      grid = double("grid")
      grid.stub(:new)
      @grid.stub(:is_full).and_return(false)
      @grid.stub(:one_side_wins).and_return(true)
      game = Game.new(grid)
      expect(game.is_finished).to eq(true)
    end

  end

end
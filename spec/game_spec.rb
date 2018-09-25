require('game')

describe Game do
  context "gives intructions about how to play the game" do
    it "tells the human player to start the game" do
      expect(STDOUT).to receive(:puts).with('Please start the game')
      subject.start
    end



  end
end
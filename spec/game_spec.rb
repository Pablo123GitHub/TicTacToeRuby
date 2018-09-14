require('game')

describe Game do
  it "prompts the human player to start the game" do
    expect(STDOUT).to receive(:puts).with('Please start the game')
    # require_relative '../lib/game'  # load/run the file
    subject.start
  end
end
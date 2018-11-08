require('game')
require('grid')
require('byebug')
require_relative '../spec/factories'


describe Game do
  include Factories

  subject { described_class.new(grid) }

  let(:grid) { Grid.new }

  describe '#start' do
    it "tells the human player to start the game" do
      welcome_message = "select a number between 0 and 8 \nthen press Enter\n"
      expect { subject.start }.to output(welcome_message).to_stdout
    end
  end

  describe "#is_finished" do
    context 'when the grid is full and one side wins' do

      let(:grid) { create_full_grid }

      it "tells the game is NOT finished" do
          allow(grid).to receive(:is_full).and_return(true)
          allow(grid).to receive(:one_side_wins).and_return(true)
        puts "ONE #{grid.is_full}"
        puts "TWO #{grid.one_side_wins}"

        expect(subject.is_finished).to eq(true)
      end
    end
  end

  context "tracks events throughout the game" do
    it "tells the game is finished if grid is NOT full and One side wins" do
      grid = double("grid")
      grid.stub(:new)
      @grid.stub(:is_full).and_return(false)
      @grid.stub(:one_side_wins).and_return(true)
      game = Game.new(grid)
      expect(game.is_finished).to eq(true)
    end
  end

  context "records input and adds a random play from the computer" do
    # it "outputs a random number between 1 and 10" do
    #     grid = double("grid")
    #     grid.stub(:new)
    #     game = Game.new(grid)
    #     expect(game).to receive(:rand).and_return(8)
    #     expect(game.random).to eq 8
    #
    # end
  #   it "records a computer play as soon as the human plays a move" do
  #     grid = double("grid")
  #     grid.stub(:new)
  #     game = Game.new(grid)
  #     expect(game).to receive(:rand).and_return(4)
  #     expect(game.records_input_and_computer_play(0)).to eq(4)
  #     expect(game.grid.answers.array.length).to eq(2)
  #
  #
  #   # end
  # end

  end
  end
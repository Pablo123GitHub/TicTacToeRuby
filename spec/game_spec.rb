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

    context "The grid is full" do
      before(:each) do
        allow(grid).to receive(:is_full).and_return(true)
      end
      # let(:grid) { create_full_grid }

      it "is finished When one side wins" do
        allow(grid).to receive(:one_side_wins).and_return(true)
        expect(subject.is_finished).to eq(true)
      end

      it "is finished When nobody wins" do
        allow(grid).to receive(:one_side_wins).and_return(false)
        expect(subject.is_finished).to eq(true)
      end
    end

    context "The grid is not full" do
      before(:each) do
        allow(grid).to receive(:is_full).and_return(false)
      end

      it "is finished When one side wins" do
        allow(grid).to receive(:one_side_wins).and_return(true)
        expect(subject.is_finished).to eq(true)
      end

      it "is NOT finished as long as nobody wins " do
        allow(grid).to receive(:one_side_wins).and_return(false)
        expect(subject.is_finished).to eq(false)
      end

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
require('game')
require('grid')
require('byebug')
require_relative '../spec/factories'


describe Game do

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
  end
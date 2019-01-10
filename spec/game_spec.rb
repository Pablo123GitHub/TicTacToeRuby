require('game')
require('grid')
require('byebug')
require_relative '../spec/factories'


describe Game do

  subject { described_class.new(grid) }

  let(:grid) { Grid.new }

  # describe '#play' do
  #   it "tells the human player to start the game" do
  #     welcome_message = "select a number between 0 and 8 \nthen press Enter\n"
  #     expect { subject.start }.to output(welcome_message).to_stdout
  #   end
  # end

  describe "#play" do

    context "Get the game started" do
      it "explains the rules at the start of the game " do
        subject.game_rules_display
        rule_message = "please enter a number where you would like to insert a Cross\n"
        empty_grid = "  0  | 1 | 2 \n ---+---+---\n  3  | 4 | 5   \n ---+---+--- \n  6  | 7 | 8  \n"
        expect { subject.game_rules_display }.to output(rule_message + empty_grid).to_stdout
      end
    end

    context "Track each player's move  " do
      it "uses the input to record it in the grid" do
        allow($stdin).to receive(:gets).and_return(1)

        expect { subject.play }.to output("output message\n").to_stdout
      end

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
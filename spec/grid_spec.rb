require 'grid'

describe Grid do

  describe "#records" do
    context " checks that the input is valid " do
      it "contains an array of 9 empty strings at the start" do
        expect(subject.answers_array).to eq(Array.new(9, ""))
      end

      it "throws an error when trying to record at the same index more than once" do
        subject.records(1, "X")
        expect { subject.records(1, "X") }.to raise_error("Index spot already taken")
      end

      it "throws an error if the input is not a number" do
        expect { subject.records("string", "X")}.to raise_error("input is not a number")
      end


      it "checks that the input is more than 0 and less or equal than 8" do
        expect{ subject.records(9, "X")}.to raise_error("Invalid index")
        expect{ subject.records(-1, "X")}.to raise_error("Invalid index")
      end
    end

    context "allocates the choices to each side playing" do
      it "allocates first decision to first player" do
        subject.records(4, 'X')
        subject.records(5, 'O')
        expect(subject.answers_array).to eq(["","","","","X","O","","",""])
      end
    end

    context "displays the grid where the X and O are recorded" do
      it " shows the intial grid with default empty grid" do
        expect(subject.display_grid()).to eq("    |   |    \n ---+---+---\n    |   |    \n ---+---+--- \n    |   |    ")
      end
      it "shows X on the grid when the player records her choice" do
        subject.records(0, 'X')
        expect(subject.display_grid()).to eq("  X |   |    \n ---+---+---\n    |   |    \n ---+---+--- \n    |   |    ")
      end

    end

    context "checks if the grid is full or not" do
      it "shows grid is full when all squares are taken" do
        subject.records(4, "X")
        subject.records(0, "O")
        subject.records(2, "X")
        subject.records(6, "O")
        subject.records(3, "X")
        subject.records(5, "O")
        subject.records(1, "X")
        subject.records(7, "O")
        subject.records(8, "O")
        expect(subject.is_full).to eq(true)
      end
      it "shows grid is NOT FULL  when NOT ALL squares are taken" do
        subject.records(0, "X")
        subject.records(4, "O")
        subject.records(6, "X")

        expect(subject.is_full).to eq(false)
      end
    end

    context " checks if one side has won the game" do
      it " shows that someone wins as soon as 3 noughts are aligned" do
        subject.records(0, "X")
        subject.records(4, "O")
        subject.records(6, "X")
        subject.records(3, "O")
        subject.records(2, "X")
        subject.records(5, "O")

        expect(subject.one_side_wins).to eq(true)
      end
      it " shows that nobody wins as long as three noughts/crosses are not aligned" do
        subject.records(0, "X")
        subject.records(4, "O")
        subject.records(6, "X")
        subject.records(3, "O")
        subject.records(2, "X")
        subject.records(8, "O")

        expect(subject.one_side_wins).to eq(false)
      end
    end
  end

  describe "#play" do
    context "Filling the grid" do
      before(:each) do
        allow(subject).to receive(:rand).and_return(0)
        subject.play(0)
        subject.play(2)
        subject.play(5)
        subject.play(7)
      end

      it "fills the full grid after a player plays 4 times" do
        expect(subject.is_full).to eq(true)
      end

      it "throws an error if a player tries to play a fifth time" do
        errorMessage = "Game is finished please start a new game !"
        expect { subject.play(8)}.to raise_error(errorMessage)
      end
    end

  end

  describe "#one_side_wins" do

    context "the human wins " do
      before(:each) do
        allow(subject).to receive(:rand).and_return(0)
      end

      it "displays 3 Xs  aligned on the first line" do
        allow(subject).to receive(:rand).and_return(3)
        subject.play(0)
        subject.play(1)
        subject.play(2)
        expect(subject.one_side_wins).to eq(true)
      end

      it "displays 3 Xs  aligned on the second line" do
        subject.play(3)
        subject.play(4)
        subject.play(5)
        expect(subject.one_side_wins).to eq(true)
      end

      it "displays 3 Xs  aligned on the third line" do
        subject.play(6)
        subject.play(7)
        subject.play(8)
        expect(subject.one_side_wins).to eq(true)
      end

      it "displays 3 Xs  aligned on the first colunn" do
        subject.play(0)
        subject.play(3)
        subject.play(6)
        expect(subject.one_side_wins).to eq(true)
      end

      it "displays 3 Xs  aligned on the second column" do
        subject.play(1)
        subject.play(4)
        subject.play(7)
        expect(subject.one_side_wins).to eq(true)
      end


      it "displays 3 Xs  aligned on the third column" do
        subject.play(2)
        subject.play(5)
        subject.play(8)
        expect(subject.one_side_wins).to eq(true)
      end


      it "displays 3 Xs  aligned on diagonal upper-left to right" do
        subject.play(0)
        subject.play(4)
        subject.play(8)
        expect(subject.one_side_wins).to eq(true)
      end


      it "displays 3 Xs  aligned on diagonal upper-right to left" do
        subject.play(2)
        subject.play(4)
        subject.play(6)
        expect(subject.one_side_wins).to eq(true)
      end
    end




  end
end
require 'grid'

describe Grid do

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
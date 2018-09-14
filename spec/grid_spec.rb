require('grid')

describe Grid do

  context " checks that the input is valid " do
    it "contains an array of 9 empty strings at the start" do
      expect(subject.answers_array).to eq(Array.new(9, ""))
    end


    it "throws an error when trying to record at the same index x times" do
      subject.records(1, "X")
      expect { subject.records(1, "X") }.to raise_error("Index spot already taken")
    end

    it "checks that the input is more than 0 and less or equal than 8" do
      expect{ subject.records(9, "X")}.to raise_error("Invalid index")
      expect{ subject.records(-1, "X")}.to raise_error("Invalid index")
    end

  context "allocates the choices to each side playing" do
    it "allocates first decision to first player" do
      subject.records(4, 'X')
      subject.records(5, 'X')
      expect(subject.answers_array).to eq(["","","","","X","X","","",""])
    end
  end
  end

end
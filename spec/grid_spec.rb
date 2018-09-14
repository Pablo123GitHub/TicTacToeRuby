require('grid')

describe Grid do

  context " checks that the input is valid " do
    it "contains an array of 9 empty strings at the start" do
      expect(subject.answers_array).to eq(Array.new(9, ""))
    end

    # it "records answers total of 1 after recording one answer" do
    #   subject.records(1)
    #   expect(subject.answers_total).to eq(1)
    # end
  #
  #   it "throws an error when trying to record at the same index x times" do
  #     subject.records(1)
  #     expect { subject.records(1) }.to raise_error("Index spot already taken")
  #   end
  #
  #   it "checks that the input is more than 0 and less or equal than 9" do
  #     expect{ subject.records(9)}.to raise_error("Invalid index")
  #     expect{ subject.records(-1)}.to raise_error("Invalid index")
  #   end
  # end
  #
  # context "allocates the choices to each side playing" do
  #   it "allocates first decision to first player" do
  #     subject.records(4)
  #     subject.records(5)
  #     expect(subject.show_first_player_decisions).to eq(["","","","","","","","",""])
  #   end
  #
  #
  end

end
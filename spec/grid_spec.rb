require('grid')

RSpec.describe Grid do


  it 'contains empty records array at the start' do
    expect(subject.answers_total).to eq(0)
  end

  it "records answers total of 1 after recording one answer" do
    subject.records(1)
    expect(subject.answers_total).to eq(1)

  end

  it "throws an error when trying to record at the same index x times" do
    subject.records(1)
    expect { subject.records(1) }.to raise_error("Index spot already taken")
  end

  it "checks that the input is more than 0 and less or equal than 9" do
    expect{ subject.records(9)}.to raise_error("Invalid index")
    expect{ subject.records(-1)}.to raise_error("Invalid index")

  end


end
require('grid')

RSpec.describe Grid do


  it 'contains empty records array at the start' do
    expect(subject.answers_total).to eq(0)
  end

  it "records answers total of 1 after recording one answer" do
    subject.records(1)
    expect(subject.answers_total).to eq(1)

  end


end
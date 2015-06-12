require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  it 'report_broken changes broken? to true' do
    subject.report_broken
    expect(subject).to be_broken
  end

end

require 'docking_station'

describe DockingStation do

  it 'should respond to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bikes' do
    subject.dock double :bike, working?: true
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument}

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can change capacity' do
    subject.capacity = 55
    expect(subject.capacity).to eq 55
  end


  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it "doesn't release broken bikes" do
      bike = double :bike, working?: false
      subject.dock bike
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock double :bike, working?: true}
      expect {subject.dock double :bike}.to raise_error 'Docking station full'
    end
  end


end

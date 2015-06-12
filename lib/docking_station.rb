require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize
    @working_bikes = []
    @broken_bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if empty?
    working_bikes.pop
  end

  def dock bike
    fail 'Docking station full' if full?
    bike.working? ? working_bikes << bike : broken_bikes << bike
  end

  private

  attr_reader :working_bikes
  attr_reader :broken_bikes

  def full?
    working_bikes.count + broken_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    working_bikes.empty?
  end

end
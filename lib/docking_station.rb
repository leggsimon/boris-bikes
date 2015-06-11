require_relative 'bike'

class DockingStation

  def release_bike
    @bike
  end

  def dock bike
    @bike = bike
  end

end
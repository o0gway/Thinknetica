require_relative 'instance_counter'

# Class route
class Route
  include InstanceCounter
  attr_reader :stations, :start_point, :end_point

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
    validate!
    @stations = [start_point, end_point]
    register_instance
  end

  def add_additional_station(station_name)
    @stations.insert(1, station_name)
  end

  def remove_additional_station(station_name)
    @stations.delete(station_name)
  end

  # def valid?
  #   validate!
  #   true
  # rescue StandardError => error
  #   false
  # end

  def validate!
    raise 'Конечная станция не может быть такой же как начальная' if @start_point == @end_point
  end
end

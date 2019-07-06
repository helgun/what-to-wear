class Item
  attr_reader :name, :type, :temperature_range

  def initialize(name, type, temperature)
    @name = name
    @type = type
    @temperature_range = temperature_to_range(temperature)
  end

  def temperature_to_range(temperature)
    lower = temperature.scan(/[+-]?\d+/)[0].to_i
    max = temperature.scan(/[+-]?\d+/)[1].to_i
    return (lower..max).to_a
  end

  def fits_for_temperature?(input)
    @temperature_range.include?(input)
  end
end

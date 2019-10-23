class Munging
  attr_reader :data
  def initialize
    @data = []
    position = 0
    File.open('weather.dat', 'r') do |f|
      f.each_line do |line|
        @data[position] = line.split(' ')
        position += 1
      end
    end
  end

  def find_smallest_temperature
    smallest_temperature = {
        position: 0,
        value: 100
    }
    temperatures = {}

    data.each_with_index do |line, position|
      low_temperature = line[2].to_i
      temperatures[position] = [line[0], low_temperature]
      if low_temperature < smallest_temperature[:value]
        smallest_temperature[:position] = position
        smallest_temperature[:value] = low_temperature
      end
    end
    temperatures[smallest_temperature[:position]]
  end
end

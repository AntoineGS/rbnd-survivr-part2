class String
  def self.colors
    color_array = []
    available_colors.each do |color, _code|
      color_array.push(color)
    end
    p color_array
  end

  def self.available_colors
    { 'red' => 31, 'green' => 32, 'yellow' => 33, 'blue' => 34, 'pink' => 35,
      'light_blue' => 94, 'white' => 97, 'light_grey' => 37, 'black' => 30 }
  end

  def self.sample_colors
    available_colors.each do |color, _code|
      puts "This is #{color}".send(color.to_sym)
    end
  end

  def self.create_colors
    available_colors.each do |color, code|
      class_eval("def #{color}; \"\\e[#{code}m\#{self}\\e[0m\" end")
    end
  end

  create_colors
end

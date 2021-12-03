class ResistorColorDuo
  Colors = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
  ]
  def self.value(resistor_colors)
    resistance_value = resistor_colors.first(2).map{ 
      |resistor_color| Colors.index(resistor_color)}
    resistance_value.join.to_i
  end
end

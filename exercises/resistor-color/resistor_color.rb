class ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.color_code(resistor_color)
    colors_array = Array(resistor_color)
    colors_array.map { |color| COLORS.index(color) }.join.to_i
  end
end

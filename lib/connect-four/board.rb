require_relative 'disc.rb'

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(6) { Array.new(7) { Disc.new } }
  end

  def to_s
    divider = "\n" + "="*14 + "\n"
    column_numbers = (1..7).to_a.join(" ")
    joined = @rows.map do |row|
      row.map { |disc| disc.to_s }.join(" ") 
    end
    column_numbers + divider + joined.join(divider) + divider
  end

  def drop_disc?(column, color)
    if column < 1 || column > 7
      return false
    end
    height = find_free_position(column - 1)
    if height == nil
      return false
    else
      @rows[height][column - 1].color = color
      return true
    end

  end

  private

  def find_free_position(column)
    (0..5).to_a.find { |x| @rows[x][column].color == :black }
  end

end


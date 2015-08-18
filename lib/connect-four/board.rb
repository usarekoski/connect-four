require_relative 'disc.rb'

class Board

  attr_reader :rows, :by_column, :by_diagonal_lr, :by_diagonal_rl

  def initialize
    @rows = Array.new(6) { Array.new(7) { Disc.new } }
    @by_column = (0..6).to_a.map do |x|
      (0..5).to_a.map { |y| [y, x] }
    end
    @by_diagonal_rl =
      (-6..6).to_a.map do |x|
        (0..6).to_a.map { |y| [y, y + x] }
      end.map do |x|
        x.select do |coord|
          coord.all? { |c| c >= 0 } && coord[0] <= 5 && coord[1] <= 6
        end
      end.select { |x| x.length >= 4 }
    @by_diagonal_lr =
      (0..12).to_a.reverse.map do |x|
        (0..6).to_a.map { |y| [x - y, y] }
      end.map do |x|
        x.select do |coord|
          coord.all? { |c| c >= 0 } && coord[0] <= 5 && coord[1] <= 6
        end
      end.select { |x| x.length >= 4 }
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


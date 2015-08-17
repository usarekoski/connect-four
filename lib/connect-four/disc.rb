class Disc

  require 'colorize'

  attr_accessor :color

  def initialize
    @color = :black
    @discs = [:black, :red, :yellow].map { |color| [color, "\u2B24".colorize(color)] }
               .to_h
  end

  def to_s
    @discs[@color]
  end

end


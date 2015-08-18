require_relative 'board'

class Game

  def initialize
    @board = Board.new
  end

  def game_over?
    def check(x)
      a = x.map do |row|
        row.map { |co| @board.rows[co[0]][co[1]] }
      end
      a.any? { |row| contains_four_same?(row) }
    end
    rows = @board.rows.any? { |row| contains_four_same?(row) }
    columns = check(@board.by_column)
    diagonals_lr = check(@board.by_diagonal_lr)
    diagonals_rl = check(@board.by_diagonal_rl)
    rows && columns && diagonals_lr && diagonals_rl
  end

  def contains_four_same?(discs)
    color = nil
    count = 0
    discs.each do |disc|
      if disc.color == :black
        count = 0
      else
        if color == disc.color
          count += 1
        else
          count = 0
        end
        color = disc.color
      end
      break if count == 3
    end
    return count == 3
  end

end


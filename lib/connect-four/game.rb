#require_relative 'board'
#require_relative 'player'
#require_relative 'disc'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def welcome
    "Connect-four \n"
  end

  def create_player(color)
    print "Name: "
    name = get_input(/[\w]/)
    Player.new(name, color)
  end

  def play(player1, player2)
    player = player1
    loop do
      puts @board.to_s
      disc_example = Disc.new.color = player.color
      puts "Player #{player.name} (disk #{disc_example.to_s}) turn:"
      puts "Give slot where to put next disc:"
      make_move(player)
      if game_over?
        puts "Player #{player.name} has won!"
        break
      end
      player = player == player1 ? player2 : player1
    end
  end

  def make_move(player)
    loop do
      input = get_input(/[1-7]/).to_i
      if @board.drop_disc?(input, player.color)
        break
      end
      puts "That column is already full."
    end
  end

  def get_input(matcher)
    loop do
      input = gets.chomp
      unless input.match(matcher) == nil
        return input
      end
      puts "Not correct input."
    end
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


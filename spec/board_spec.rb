require_relative 'spec_helper'

describe Board do

  let(:board) { Board.new }

  context "when new" do

    it "has six rows" do
      expect(board.rows.size).to eql 6
    end

    it "and seven columns" do
      expect(board.rows[0].length).to eql 7
    end

    it "has to_s string of empty board" do
      disc = Disc.new
      expect(board.to_s.split(disc.to_s).size).to eql 6*7 + 1
    end

  end

  context "coordinates" do

    it "#by_column has one column in it" do
      example_column = [[5,3], [4,3], [3,3], [2,3], [1,3], [0,3]].reverse
      expect(board.by_column.find { |x| x == example_column }).to  eql example_column
    end

  end

  context "when disc is dropped" do

    it "disc is dropped by giving the column (1-7)" do
      board.drop_disc?(1, :red)
      expect(board.rows[0][0].color).to eql :red
    end

    it "returns true if drop is succesful" do
      expect(board.drop_disc?(1, :red)).to be true
    end

    it "returns false if dropped to invalid column" do
      expect(board.drop_disc?(0, :red)).to be false
      expect(board.drop_disc?(8, :red)).to be false
    end

    it "all columns work" do
      (1..7).to_a.each { |x| board.drop_disc?(x, :red) }
      expect(board.rows[0].all? { |d| d.color == :red}).to be true
    end

    it "discs stack" do
      board.drop_disc?(1, :red)
      board.drop_disc?(1, :red)
      expect(board.rows[1][0].color).to eql :red
    end

    it "return false if column is full" do
      6.times { board.drop_disc?(1, :yellow) }
      expect(board.drop_disc?(1, :yellow)).to be false
    end

  end

end


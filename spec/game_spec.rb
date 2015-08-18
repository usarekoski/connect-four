require_relative 'spec_helper'

describe Game do

  let (:game) { Game.new }

  context "#contains_four_same?" do

    before :each do
      @discs = Array.new(6) {Disc.new}
    end

    it "is false if all discs are black" do
      expect(game.contains_four_same?(@discs)).to be false
    end

    it "is false if there is colored disc" do
      @discs[3].color = :red
      expect(game.contains_four_same?(@discs)).to be false
    end

    it "is true if there is four red discs in a row" do
      (2..5).to_a.each do |x|
        @discs[x].color = :red
      end
      expect(game.contains_four_same?(@discs)).to be true
    end


  end

  context "when new" do

    it "#game_over? is false" do
      expect(game.game_over?).to be false
    end

  end

end


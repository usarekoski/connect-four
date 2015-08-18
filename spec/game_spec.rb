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

  context "#game_over?" do

    it "is false when board is empty" do
      expect(game.game_over?).to be false
    end

  end

  it "has welcome message" do
    expect(game.welcome).to be_instance_of(String)
  end

  context "#get_input" do

    it "accepts numbers in given range" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return "2"
      expect( game.get_input(/2/)).to eql "2"
    end

    it "loops until correct input is given" do
      allow($stdout).to receive(:write)
      allow_any_instance_of(Kernel).to receive(:gets).and_return("a", "2")
      #Thread.new do
       # sleep(0.1)
        #allow_any_instance_of(Kernel).to receive(:gets).and_return "2"
      #end
      expect(game.get_input(/2/)).to eql "2"
    end

  end

  context "#create_player" do

    before :each do
      allow(game).to receive(:get_input).and_return "Name"
    end

    it "creates a new Player object" do
      player= Player.new("Name", :red)
      tested = game.create_player(:red)
      expect(tested.name).to eql player.name
      expect(tested.color).to eql player.color
    end

  end

  context "#make_move" do

    it "calls drop_disc? with given input" do
      expect(game.board).to receive(:drop_disc?).with(1, :color).and_return true
      allow(game).to receive(:get_input).and_return("1")
      player = Player.new("Name", :color)
      game.make_move(player)
    end

  end

end


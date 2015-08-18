require_relative 'spec_helper'

describe Player do

  let (:player) { Player.new("Name", :color) }

  it "has a name" do
    expect(player.name).to eql "Name"
  end

  it "has a color symbol" do
    expect(player.color).to eql :color
  end

end


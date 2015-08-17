require_relative 'spec_helper'
require 'colorize'

describe Disc do

  let (:disc) { Disc.new }

  context "when new" do

    it "has default color of black" do
      expect(disc.color).to eql :black
    end

    it "has default #to_s string of black disc" do
      expect(disc.to_s).to eql "\u2B24".colorize(:black)
    end

  end

  context "when color is changed" do

      before :each do
        disc.color = :red
      end

    it "changes color to red" do
      expect(disc.color).to eql :red
    end

    it "changes to_s to red disc" do
      expect(disc.to_s).to eql "\u2B24".colorize(:red)
    end

  end

end


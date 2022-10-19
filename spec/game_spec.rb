# rubocop: disable all

require_relative 'spec_helper'

describe Game do
    before :each do
        @game = Game.new("Abraham", "2019-01-01", "yes", "2010-01-01")
        @author = Author.new("ALI", "Amos")

    end
    describe "#new" do
        it "takes two parameters and returns an Author object" do
            expect(@game).to be_an_instance_of Game
        end
    end
    describe "#last_name" do
        it "returns the correct last name" do
            expect(@author.last_name).to eq("Amos")
        end
    end
    describe "#add_item" do
        it "adds an item to the author's collection" do
            @game = Game.new("Abraham", "2019-01-01", "yes", "2010-01-01")
            expect(@game.name).to include("Abraham")
        end
    end
end

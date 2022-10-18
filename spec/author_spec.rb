require_relative 'spec_helper'

describe Author do
    before :each do
        @author = Author.new("ALI", "Amos")
    end
    describe "#new" do
        it "takes two parameters and returns an Author object" do
            expect(@author).to be_an_instance_of Author
        end
    end
    describe "#first_name" do
        it "returns the correct first name" do
            expect(@author.first_name).to eq("ALI")
        end
    end
    describe "#last_name" do
        it "returns the correct last name" do
            expect(@author.last_name).to eq("Amos")
        end
    end
    # describe "#add_item" do
    #     it "adds an item to the author's collection" do
    #         @game = Game.new("Abraham", "2019-01-01", "yes", "2010-01-01")
    #        @author.add_author(game)
    #         expect(game).to include(game)
    #     end
    # end
end
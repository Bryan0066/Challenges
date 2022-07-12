require "spec-helper"

describe Card do
    
      # '♦', '♣', '♠', '♥'

    let(:two_card) {Card.new("2",'♥')}
    let(:king_card) {Card.new("K",'♣')}

    describe ".new"
      it "returns a new card object" do 
        expect (Card.new("2",'♥')).to be_a(Card)
      end
    end

    describe "#rank" do
        it "returns the rank of the card" do
        expect (two_card.rank).to eq ("2")
        end
    end

    describe "#suit" do
        it "returns the suit of the card" do
            expect (two_card.suit).to eq ('♥')
        end
    end

    describe "#facecard?" do
        context "if the card is a face card" do
        it "returns true" do
            expect(king_card.facecard?).to eq
        end

        context "if card is not a face card" do
        end
    end
end
require 'card'
require 'deck'
require 'hand'
require 'player'
require 'game'


RSpec.describe Card do
  subject(:card) { Card.new(1, "spade") }
  describe "#initialize" do
    it "should take value" do
      expect(card.value).to eq(1)
    end

    it "should take a suit" do
      expect(card.suit).to eq("spade")
    end
  end

end

RSpec.describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "should make a deck of 52 cards" do
      expect(deck.count).to eq(52)
    end
  end

  describe "#draw" do
    it "should remove a random card from the deck" do
      deck.draw
      expect(deck.count).to eq(51)
    end

    it "should return the card" do
      expect(deck.draw.class).to eq(Card)
    end
  end
end

RSpec.describe Hand do
  let(:deck) { Deck.new }
  subject(:hand) {Hand.new(deck)}
  describe "#initialize" do
    it "should have a hand size of five" do
      expect(hand.count).to eq(5)
    end
  end

  describe "#straight_flush" do
    it "should recognize a hand with a straight flush" do
      hand[0] = Card.new(10, "spade")
      hand[1] = Card.new(11, "spade")
      hand[2] = Card.new(12, "spade")
      hand[3] = Card.new(13, "spade")
      hand[4] = Card.new(1, "spade")
      expect(hand.straight_flush).to be true
    end
  end

  describe "#four_of_a_kind" do
    it "should recognize a hand with four of a kind" do
      hand[0] = Card.new(10, "heart")
      hand[1] = Card.new(10, "club")
      hand[2] = Card.new(10, "diamond")
      hand[3] = Card.new(10, "spade")
      hand[4] = Card.new(1, "spade")
      expect(hand.four_of_a_kind).to be true
    end
  end

  describe "#trips" do
  it "should recognize a hand with trips" do
    hand[0] = Card.new(10, "heart")
    hand[1] = Card.new(10, "club")
    hand[2] = Card.new(10, "diamond")
    hand[3] = Card.new(9, "spade")
    hand[4] = Card.new(1, "spade")
    expect(hand.trips).to be true
  end
end

  describe "#pair" do
    it "should recognize a hand with a pair" do

    end
  end
end

#pair < two pair < trips < straight < flush < full house < four of a kind < straight flush < royal flush

# RSpec.describe Player do


# end

# RSpec.describe Game do


# end
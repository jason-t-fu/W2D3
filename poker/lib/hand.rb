require_relative 'deck'
class Hand
  attr_reader :deck, :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    fill_hand
  end

  def check_hand
    
  end

  def four_of_a_kind
    card_values = hand.map { |card| card.value }
    count_hash = Hash.new(0)

    card_values.each do |card_val|
      count_hash[card_val] += 1
    end

    return true if count_hash.values.count(4) == 1 && count_hash.values.count(1) == 1
    false
  end

  def trips
    card_values = hand.map { |card| card.value }
    card_values.uniq.each do |card_val|
      return true if card_values.count(card_val) == 3
    end
    false
  end

  def two_pair
    card_values = hand.map { |card| card.value }
    count_hash = Hash.new(0)

    card_values.each do |card_val|
      count_hash[card_val] += 1
    end

    return true if count_hash.values.count(2) == 2
    false
  end

  def full_house
    card_values = hand.map { |card| card.value }
    count_hash = Hash.new(0)

    card_values.each do |card_val|
      count_hash[card_val] += 1
    end

    return true if count_hash.values.count(2) == 1 &&count_hash.values.count(3) == 1
    false
  end

  def count
    @hand.count
  end

  def [](loc)
    @hand[loc]
  end

  def []=(loc, card)
    @hand[loc] = card
  end

  private

  def fill_hand
    5.times do
      hand << deck.draw
    end
    hand.sort_by! { |card| card.value }
  end

end
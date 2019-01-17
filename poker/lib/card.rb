require 'colorize'

class Card
CARD_VALUES = {
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  10 => "10",
  11 => "jack",
  12 => "queen",
  13 => "king",
  14 => "ace"
}.freeze

SUIT_COLORS = {
  "spade" => "spade".colorize(:black),
  "club" => "club".colorize(:black),
  "heart" => "heart".colorize(:red),
  "diamond" => "diamond".colorize(:red)
}.freeze

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def inspect
    "#{CARD_VALUES[value]} of #{SUIT_COLORS[suit]}"
  end
end
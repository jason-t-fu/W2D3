require_relative 'card'
class Deck

  attr_reader :deck

  def initialize
    @deck = []
    populate
  end

  def draw
    card = @deck.sample
    @deck.delete(card)
  end

  def count
    @deck.count
  end

  private
  def populate
    (2..14).each do |num|
      %w(diamond club heart spade).each do |suit|
        @deck << Card.new(num, suit)
      end
    end
  end


end
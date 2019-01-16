require 'tdd'

RSpec.describe do
  
  describe "#my_uniq" do
    subject(:arr1) { Array.new([1, 2, 1, 3, 3]) }

    it "returns the unique elements in an Array in the order in which they first appeared" do
      expect(arr1.my_uniq).to eq([1, 2, 3])
    end

    it "does not use the #uniq method in Array" do
      expect(arr1).to_not receive(:uniq)
      arr1.my_uniq
    end
  end

  describe "#two_sum" do

    context "when the method is called on an array" do
      subject(:arr2) { Array.new([-1, 0, 2, -2, 1]) }
      it "returns an array of all positions where the elements at those positions sum to zero" do  

        expect(arr2.two_sum).to eq([[0, 4], [2,3]])
      end
    end

    context "when multiple pairs are found with a common index" do
      subject(:arr2) { Array.new([1, -1, -1]) }
      it "returns an array of pairs sorted 'dictionary-wise'" do

        expect(arr2.two_sum).to eq([[0, 1], [0, 2]])
      end
    end

  end

  describe "#my_transpose" do
    subject(:arr3) {Array.new([[0,1,2], [3,4,5], [6,7,8]])}

    it "returns a transposed array" do
      expect(arr3.my_transpose).to eq(arr3.transpose)
    end

    it "does not use #transpose on the array" do
      expect(arr3).to_not receive(:transpose)
      arr3.my_transpose
    end 

  end

  describe "#stock_picker" do 
    subject(:arr4) {Array.new([4,3,8,1,0,2,4,8,6,7,5,4,50,9,8,4])}

    it "returns the indices of the most profitable buy and sell dates" do
      expect(arr4.stock_picker).to eq([4, 12])
    end

  end

  describe Towers do
    subject(:game) { Towers.new }

    describe "#initialize" do
      it "creates the default tower" do
        expect(game.towers).to eq([[3,2,1], [], []])
      end
    end

    describe "#move" do
      it "moves a piece from one tower to another" do
        game.move(0, 1)
        expect(game.towers).to eq([[3, 2], [1], []])
      end

    end


    describe "won?" do
      it "moves the tower to a new location" do
        expect(game.won?).to be false
        game.towers[0], game.towers[1] = game.towers[1], game.towers[0]
        expect(game.won?).to be true
      end
    end

  end


end
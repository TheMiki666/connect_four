require_relative "../lib/column"

describe Column do
  subject(:test_column) { described_class.new}
  describe "#get_chips" do                          
    it "shows an empty column" do
      expect(test_column.get_chips).to eql([0,0,0,0,0,0])
    end
    it "return the exact combination of chips previously filled" do
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      expect(test_column.get_chips).to eql([1,2,2,0,0,0])
    end
  end
  describe "#add_chip" do
    it "return true with chip 1" do
      expect(test_column.add_chip(1)).to be(true)
    end
    it "return true with chip 2" do
      expect(test_column.add_chip(2)).to be(true)
    end
    it "return false with chips differents of 1 or 2" do
      expect(test_column.add_chip(3)).to be(false)
    end
    it "return false when the column is full" do
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(2)
      expect(test_column.add_chip(1)).to be(false)
    end
    it "return the exact combination of chips when it is filled" do
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.add_chip(2)
      expect(test_column.get_chips).to eql([1,2,2,1,1,2])
     end
  end
    
  describe "#clear" do
    it "#clear empties the column" do
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.clear
      expect(test_column.get_chips).to eql([0,0,0,0,0,0])
    end
  end
    
  describe "#is_full?" do
    it "return true if it is full" do
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(2)
      expect(test_column.is_full?).to be(true)
    end

    it "return false if it is not full" do
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.add_chip(1)
      expect(test_column.is_full?).to be(false)
    end
  end

  describe "#find_winner" do
    it "return 1 if there is a winning column of 4 '1' chips" do
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(1)
      expect(test_column.find_winner).to eql(1)
    end
    it "return 2 if there is a winning column of 4 '2' chips" do
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(2)
      test_column.add_chip(2)
      expect(test_column.find_winner).to eql(2)
    end
    it "return 0 if there is no winner" do
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(1)
      test_column.add_chip(2)
      test_column.add_chip(1)
      test_column.add_chip(1)
      expect(test_column.find_winner).to eql(0)
    end
  end
  
end
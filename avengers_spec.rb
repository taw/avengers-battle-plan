#!/usr/bin/env ruby

require "./avengers"

describe Avengers do
  describe "#initialize" do
    it "Avengers are sorted" do
      Avengers.new([6,2,4], [], []).avengers.should == [2,4,6]
    end

    it "Aliens are are sorted by power" do
      Avengers.new([], [1,10,5], [10,7,3]).aliens.should == [[1,10], [5,3], [10,7]]
    end

    it "Zero count aliens should not be included" do
      Avengers.new([], [1,10,5], [10,0,3]).aliens.should == [[1,10], [5,3]]
    end
  end

  it '#can_avengers_win?' do
    Avengers.new([10], [100], [1]).can_avengers_win?.should == false
    Avengers.new([10], [10], [1]).can_avengers_win?.should == true
  end

  it "#number_of_aliens_each_avenger_can_defeat" do
    av = Avengers.new([2,3,5], [1,3,4], [2,9,4])
    av.number_of_aliens_each_avenger_can_defeat.should == [2, 11, 15]
  end

  it "#difficult_aliens" do
    av = Avengers.new([2,3,5], [1,3,4], [2,9,4])
    av.difficult_aliens.should == [4, 13, 15]
  end

  context "Acceptance tests" do
    it "Test 1" do
      Avengers.new([2,3,5], [1,1,2], [2,9,4]).battle_plan.should == 5
    end

    it "Test 2" do
      Avengers.new([2,3,5], [1,3,4], [2,9,4]).battle_plan.should == 7
    end

    it "Test 3" do
      Avengers.new([14,6,22], [8,33], [9,-1]).battle_plan.should == -1
    end

    it "Test 4" do
      Avengers.new(
        [17, 10, 29, 48, 92, 60, 80, 100, 15, 69, 36, 43, 70, 14, 88, 12, 14, 29, 9, 40],
        [93, 59, 27, 68, 48, 82, 15, 95, 61, 49, 68, 15, 16, 26, 64, 82, 7, 8, 92, 15],
        [56, 26, 12, 52, 5, 19, 93, 36, 69, 61, 68, 66, 55, 28, 49, 55, 63, 57, 33, 45]
      ).battle_plan.should == 92
    end
  end
end

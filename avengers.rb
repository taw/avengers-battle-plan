#!/usr/bin/env ruby

class Array
  def sum
    inject(0, &:+)
  end
end

class Avengers
  attr_reader :avengers
  attr_reader :aliens

  def initialize(avengers, aliens, aliens_count)
    @avengers = avengers.sort
    @aliens = aliens.zip(aliens_count).sort.select{|power, count| count != 0}
  end

  def number_of_aliens
    @aliens.map{|power, count| count}.sum
  end

  def number_of_aliens_each_avenger_can_defeat
    @avengers.map{|power|
      @aliens.map{|alien_power, count|
        power >= alien_power ? count : 0
      }.sum
    }
  end

  def difficult_aliens
    ([number_of_aliens] + number_of_aliens_each_avenger_can_defeat.map{|power| number_of_aliens-power}[0..-2]).reverse
  end

  def can_avengers_win?
    @avengers[-1] >= @aliens[-1][0]
  end

  def battle_plan
    # Can't win
    return -1 unless can_avengers_win?
    # Just make last avenger do all the fighting
    rv = 0
    difficult_aliens.each_with_index do |power, i|
      min_fatigue = (power.to_f / (i+1)).ceil
      rv = [rv, min_fatigue].max
    end
    rv
  end
end

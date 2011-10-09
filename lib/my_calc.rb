class MyCalc
  attr_accessor :running_total

  def initialize
    @running_total = 0
  end

  def total calculation=0
    @running_total += calculation
  end

end
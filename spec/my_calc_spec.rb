require "rspec"

require './lib/my_calc.rb'

describe MyCalc do

  it "returns 0 if no calculation has been done" do
    MyCalc.new.running_total.should == 0
  end

  it "adds the result of the calculation to running total" do
    calc = MyCalc.new
    calc.total 2
    calc.running_total.should == 2
  end
end



#1 Add numbers together
#2 Substract
#3 Keep running total
#4 Clear running total
#Non-functional requirements
#- Must have tests
#- Automate running the test file in Rake
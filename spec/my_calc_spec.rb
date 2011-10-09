require "rspec"

require './lib/my_calc.rb'

describe MyCalc do

  before :each do
    @calc = MyCalc.new
  end

  it "should have a running total of 0 when it's first created" do
    MyCalc.new.running_total.should == 0
  end

  it "should calculate the expression and return the result" do
      @calc.total(2).should == 2
  end

  it "should add the result of the calculation to running total" do
    @calc.total 2
    @calc.total '3'

    @calc.running_total.should == 5
  end

  it "should have a running total of 0, when cleared" do
    @calc.total 2
    @calc.clear
    @calc.running_total.should == 0
  end

  it "should compact operators between operands" do
    @calc.total('-1 - -2').should == 1
    @calc.total('1 + -2').should  == -1
  end

  it "should strip additional whitespace and deal with more complex expressions" do
    @calc.total('10 + 2  -1-  6 - 7 - -2').should == 0
  end


  it "should raise an ArgumentError if provided with rubbish" do
   lambda{ @calc.total '2 cats + 1 dog ?' }.should raise_error(ArgumentError, "Please use only digits, + and - in expressions")
  end

end
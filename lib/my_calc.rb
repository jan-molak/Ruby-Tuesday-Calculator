class MyCalc
  attr_accessor :running_total

  def initialize
    @running_total = 0
  end

  def total calculation=0
    raise ArgumentError, 'Please use only digits, + and - in expressions' if calculation =~ /([^\d\+\-\s])/

    # remove everything that's not a number, + or -
    calculation.to_s.gsub!(/[^\d\+\-]/, '')

    raise ArgumentError, 'Using more than two operators per operand doesn\'t really make too much sense, does it? :)' if calculation =~ /([\+\-]{3,})/

    total = 0

    tokens = calculation.to_s.scan(/([\+\-]*\d+)/).flatten.compact.map do | token |
      number = token.scan(/\d+/).flatten.compact[0].to_i
      # that's a bit of a cheat, but since we only allow + and - operators .. ;-)
      number = -number unless token.count('-') % 2 == 0
      total += number
    end

    @running_total += total
    total
  end

  def clear
    @running_total = 0
  end

end
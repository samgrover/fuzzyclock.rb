# encoding: utf-8

require 'fuzzyclock/version'

class FuzzyClock
  @@HourToString = {
    0  => "twelve",
    1  => "one",
    2  => "two",
    3  => "three",
    4  => "four",
    5  => "five",
    6  => "six",
    7  => "seven",
    8  => "eight",
    9  => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
  }

  attr_writer :time

  def initialize(time=Time.now)
    @time = time
  end

  # :s = suffix, :p = prefix
  def fuzziness(min=0)
    case min
    when 0       then [:s, "o'clock"]
    when 1..2    then [:p, "a bit after"]
    when 3..7    then [:p, "five past"]
    when 8..12   then [:p, "ten past"]
    when 13..17  then [:p, "quarter past"]
    when 18..22  then [:p, "twenty past"]
    when 23..27  then [:p, "twenty five past"]
    when 28..32  then rand(2) == 0 ? [:p, "half past"] : [:s, "thirty"] 
    when 33..37  then [:p, "twenty five to"]
    when 38..42  then [:p, "twenty to"]
    when 43..47  then [:p, "quarter to"]
    when 48..52  then [:p, "ten to"]
    when 53..57  then [:p, "five to"]
    when 58..59  then rand(2) == 0 ? [:p, "almost"] : [:p, "nearly"]
    end
  end

  def to_s
    hr, min = @time.hour, @time.min
    if (33..59) === min
      hr += 1
    end
    str = @@HourToString[hr % 12]
    fuzz = fuzziness(min)
    if fuzz[0] == :p
      str = fuzz[1] + " " + str
    elsif fuzz[0] == :s
      str = str + " " + fuzz[1]
    end
  end
end

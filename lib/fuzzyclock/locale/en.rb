# encoding: utf-8

class FuzzyClock
  @@locales ||= {}
  @@locales[:en] = {
    :about => "it's about %t",
    :hour => {
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
    },
    :min => {
      0..0   => "%0 o'clock",
      1..2   => "a bit after %0",
      3..7   => "five past %0",
      8..12  => "ten past %0",
      13..17 => "quarter past %0",
      18..22 => "twenty past %0",
      23..27 => "twenty five past %0",
      28..32 => ["half past %0", "%0 thirty"], # randomly picked
      33..37 => "twenty five to %1",
      38..42 => "twenty to %1",
      43..47 => "quarter to %1",
      48..52 => "ten to %1",
      53..57 => "five to %1",
      58..59 => ["almost %1", "nearly %1"] # randomly picked
    }
  }
end

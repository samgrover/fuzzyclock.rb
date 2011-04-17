# encoding: utf-8

class FuzzyClock
  @@locales ||= {}
  @@locales[:se] = {
    :about => "runt %t",
    :hour => {
      0  => "tolv",
      1  => "ett",
      2  => "två",
      3  => "tree",
      4  => "fyra",
      5  => "fem",
      6  => "sex",
      7  => "sju",
      8  => "åtta",
      9  => "nio",
      10 => "tio",
      11 => "elva",
      12 => "tolv",
    },
    :min => {
      0..0   => "klockan %0",
      1..2   => "lite efter %0",
      3..7   => "fem över %0",
      8..12  => "tio över %0",
      13..17 => "kvart över %0",
      18..22 => "tjugo över %0",
      23..27 => "tjugofem över %0",
      28..32 => ["halv %1", "%0 och tretti"], # randomly picked
      33..37 => "tjugofem i %1",
      38..42 => "tjugo i %1",
      43..47 => "kvart i %1",
      48..52 => "tio i %1",
      53..57 => "fem i %1",
      58..59 => ["nästan %1", "strax före %1"] # randomly picked
    }
  }
end

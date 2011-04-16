# encoding: utf-8

require 'fuzzyclock/version'
require 'fuzzyclock/locale/en'
require 'fuzzyclock/locale/se'

class FuzzyClock
  
  class UnsupportedLocale < ArgumentError; end
  
  @@locale ||= {}
  
  def self.parse(time, locale = nil)
    locale ||= :en
    
    raise UnsupportedLocale, %Q{Locale "#{locale}" is not supported.} unless @@locale.has_key?(locale.to_sym)
    base = @@locale[locale.to_sym]
    
    this_hour = base[:hour][time.hour % 12]
    next_hour = base[:hour][time.hour % 12 + 1]
    
    fuzz = nil
    base[:min].each do |range, value|
      fuzz = value if range.include?(time.min)
      fuzz = fuzz[rand(fuzz.size)] if fuzz.is_a?(Array)
    end
    
    fuzz.gsub!('%0', this_hour)
    fuzz.gsub!('%1', next_hour)
    fuzz
  end
  
  attr_accessor :time
  attr_accessor :locale
  
  def initialize(time = nil, locale = nil)
    @time ||= Time.now
    @locale ||= :en
  end
  
  def parse
    self.class.parse(@time, @locale)
  end
  alias :to_s :parse
  
end

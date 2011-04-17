# encoding: utf-8

require 'fuzzyclock/locale/en'
require 'fuzzyclock/locale/se'
require 'fuzzyclock/locale/el'
require 'fuzzyclock/version'

class FuzzyClock
  
  class UnsupportedLocale < ArgumentError; end
  
  @@locales ||= {}
  
  def self.parse(time, opts = {})
    self.new(time, opts).to_s
  end
  
  attr_accessor :time
  attr_accessor :locale
  attr_accessor :about
  attr_accessor :capitalize
  attr_accessor :upcase
  
  def initialize(time = nil, opts = {})
    @time       = time              || Time.now
    @locale     = opts[:locale]     || :en
    @about      = opts[:about]      || false
    @capitalize = opts[:capitalize] || false
    @upcase     = opts[:upcase]     || false
  end
  
  def parse
    raise UnsupportedLocale, %Q{Locale "#{@locale}" is not supported.} unless @@locales.has_key?(@locale.to_sym)
    lang = @@locales[@locale.to_sym]
    
    this_hour = lang[:hour][@time.hour % 12]
    next_hour = lang[:hour][@time.hour % 12 + 1]
    
    fuzz = nil
    lang[:min].each do |range, value|
      if range.include?(@time.min)
        fuzz = value.is_a?(Array) ? value[rand(value.size)] : value
      end
    end
    
    fuzz.gsub!('%0', this_hour)
    fuzz.gsub!('%1', next_hour)
    
    fuzz = lang[:about].gsub('%t', fuzz) if @about
    fuzz.capitalize! if @capitalize
    fuzz.upcase! if @upcase
    
    fuzz
  end
  alias :to_s :parse
  
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fuzzyclock/version"

Gem::Specification.new do |s|
  s.name        = "fuzzyclock"
  s.version     = Fuzzyclock::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Sam Grover', 'Jim Myhrberg']
  # s.email       = ["TODO: Write your email address"]
  s.homepage    = 'https://github.com/samgrover/fuzzyclock.rb'
  s.summary     = 'A Ruby class to imitate the basic functionality of the cool FuzzyClock application'
  s.description = 'A Ruby class to imitate the basic functionality of the cool FuzzyClock application'

  s.rubyforge_project = "fuzzyclock"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

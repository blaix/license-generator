# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require "license-generator/version"

Gem::Specification.new do |s|
  s.name        = "license-generator"
  s.version     = License::Generator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Blake"]
  s.email       = ["justin@hentzia.com"]
  s.homepage    = "https://github.com/blaix/license-generator"
  s.summary     = %q{Open Source License generator}
  s.description = %q{Generate an open source license file in your project.}

  s.rubyforge_project = "license-generator"

  s.add_dependency "thor"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   << "licgen"
  s.require_paths = ["lib"]
end

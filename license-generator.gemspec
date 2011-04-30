# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "license-generator/version"

Gem::Specification.new do |s|
  s.name        = "license-generator"
  s.version     = License::Generator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Blake"]
  s.email       = ["justin@hentzia.com"]
  s.homepage    = ""
  s.summary     = %q{Open Source License generator}
  s.description = %q{Generate an open source license file in your project.}

  s.rubyforge_project = "license-generator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

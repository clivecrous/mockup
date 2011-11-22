# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mockup/version"

Gem::Specification.new do |s|
  s.name        = "mockup"
  s.version     = Mockup::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Cory Ondrejka","Clive Crous"]
  s.email       = ["cory.ondrejka@gmail.com","clive@crous.co.za"]
  s.homepage    = "http://github.com/cory/mockup"
  s.summary     = %q{Convert Balsamiq XML export to HTML page}
  s.description = %q{Convert Balsamiq XML export to HTML page}

  s.add_development_dependency "bundler", ">= 1.0.14"
  s.add_development_dependency "rake", ">= 0.9.2.2"
  s.add_development_dependency "rspec", ">= 2.7.0"

  s.add_dependency "hpricot", ">= 0.8.4"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

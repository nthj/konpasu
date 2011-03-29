# -*- encoding: utf-8 -*-
require File.expand_path("../lib/konpasu/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "konpasu"
  s.version     = Konpasu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nathaniel Jones']
  s.email       = ['nathaniel@pointeractive.com']
  s.homepage    = "http://rubygems.org/gems/konpasu"
  s.summary     = "Drop-in Heroku/Compass integration"
  s.description = "Drop-in Heroku/Compass integration"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "konpasu"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end

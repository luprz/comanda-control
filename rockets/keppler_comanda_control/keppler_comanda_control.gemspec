$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "keppler_comanda_control/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "keppler_comanda_control"
  s.version     = KepplerComandaControl::VERSION
  s.authors     = ["luprz"]
  s.email       = ["luis.prz7@gmail.com"]
  s.homepage    = 'http://keppleradmin.com'
  s.summary     = 'keppler_comanda_control'
  s.description = 'keppler_comanda_control'
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '5.2.0'
  s.add_dependency 'simple_form'
  s.add_dependency 'haml_rails'
  s.add_dependency 'pundit'
  s.add_development_dependency 'pg'
end

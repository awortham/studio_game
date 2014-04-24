Gem::Specification.new do |s|
  s.name         = "gameology"
  s.version      = "1.0.0"
  s.author       = "Aaron Wortham"
  s.email        = "awortham@newlifechurch.tv"
  s.summary      = "Play this awesome game with dice"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
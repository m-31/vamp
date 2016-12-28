# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vamp/version'

Gem::Specification.new do |spec|
  spec.name          = "vamp"
  spec.version       = Vamp::VERSION
  spec.authors       = ["Michael Meyling"]
  spec.email         = ["search@meyling.com"]
  spec.summary       = %q{vampire quotes}
  spec.description   = %q{Provide random quotes concerning vampires.}
  spec.homepage      = "https://github.com/m-31/vamp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.post_install_message = "  .. may the blood never cease to flow .."

  spec.required_ruby_version = '>= 1.9.0'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  # spec.add_development_dependency "thor"
end

# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "dinkers"
  spec.version       = "0.2"
  spec.authors       = ["Kayra Alat"]
  spec.email         = ["contact@kayra.io"]

  spec.summary       = %q{Technical knowledge share.}
  spec.homepage      = "https://github.com/Dinkers/dinkers.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.9.0"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 12.3.3"
end
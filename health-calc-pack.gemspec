# frozen_string_literal: true

require_relative "lib/health/calc/pack/version"

Gem::Specification.new do |spec|
  spec.name          = "health-calc-pack"
  spec.version       = Health::Calc::Pack::VERSION
  spec.authors       = ["Rafael Prallon Maldonado Charruff"]
  spec.email         = ["rafaelprallon@gmail.com"]

  spec.summary       = "Gem with health operations like IMC and macronutrients."
  spec.description   = "Gem with health operations like IMC and macronutrients."
  spec.homepage      = "https://github.com/RafaelPrallon/health-calc-pack"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/RafaelPrallon/health-calc-pack"
  spec.metadata["changelog_uri"] = "https://github.com/RafaelPrallon/health-calc-pack/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

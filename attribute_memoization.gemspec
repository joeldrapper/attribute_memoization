# frozen_string_literal: true

require_relative "lib/attribute_memoization/version"

Gem::Specification.new do |spec|
  spec.name = "attribute_memoization"
  spec.version = AttributeMemoization::VERSION
  spec.authors = ["Joel Drapper"]
  spec.email = ["joel@drapper.me"]

  spec.summary = "Attribute Memoization"
  spec.description = "Patch attr_reader to provide attribute memoization."
  spec.homepage = "https://github.com/joeldrapper/attribute_memoization"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joeldrapper/attribute_memoization"
  spec.metadata["changelog_uri"] = "https://github.com/joeldrapper/attribute_memoization"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

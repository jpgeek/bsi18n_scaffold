require_relative "lib/bsi18n_scaffold/version"

Gem::Specification.new do |spec|
  spec.name        = "bsi18n_scaffold"
  spec.version     = Bsi18nScaffold::VERSION
  spec.authors     = ["Steve Brown"]
  spec.email       = ["steve@zergsoft.com"]
  spec.homepage    = "https://github.com/jpgeek/bsi18n_scaffold"
  spec.summary     = "Bootstrap and I18n enabled scaffold with translation files."
  spec.description = "Bootstrap and I18n enabled scaffold with translation files."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
end

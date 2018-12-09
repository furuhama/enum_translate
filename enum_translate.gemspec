# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enum_translate/version'

Gem::Specification.new do |spec|
  spec.name          = 'enum_translate'
  spec.version       = EnumTranslate::VERSION
  spec.authors       = ['furuhama']
  spec.email         = ['furuhama@users.noreply.github.com']

  spec.summary       = %q{ Translate ActiveRecord::Enum attributes. }
  spec.description   = %q{ Translate ActiveRecord::Enum attributes. It extends ActiveRecord methods like ActiveModel::Translation and `enumerize` gem do. }
  spec.homepage      = 'https://github.com/furuhama/enum_translate'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'TODO: Set to 'http://mygemserver.com''

  #   spec.metadata['homepage_uri'] = spec.homepage
  #   spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '~> 5.0'
  spec.add_dependency 'activesupport', '~> 5.0'
  spec.add_dependency 'i18n', '>= 0.7', '< 2'
end

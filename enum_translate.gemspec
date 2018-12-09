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

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '~> 5.0'
  spec.add_dependency 'activesupport', '~> 5.0'
  spec.add_dependency 'i18n', '>= 0.7', '< 2'
end

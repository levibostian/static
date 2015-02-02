# coding utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'betterBuster'
  spec.version = '1.0'
  spec.authors = ['Levi Bostian']
  spec.email = ['levi.bostian@gmail.com']
  spec.summary = %q{Static page generator for Ghost blog platform}
  spec.description = File.read('README.md')
  spec.homepage = 'https://github.com/levibostian/betterBuster'
  spec.license = 'MIT'
  spec.files = Dir['lib/*.rb']
  spec.executables = ['betterBuster']
  spec.test_files = ['tests/test_betterBuster.rb']
  spec.require_paths = ['lib']
end

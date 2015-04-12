# coding utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'static'
  spec.version = '1.0'
  spec.authors = ['Levi Bostian']
  spec.email = ['levi.bostian@gmail.com']
  spec.summary = %q{Static website generator to push dynamic website to GitHub pages for static hosting.}
  spec.description = File.read('README.md')
  spec.homepage = 'https://github.com/levibostian/static'
  spec.license = 'MIT'
  spec.require_paths = ['lib']
end

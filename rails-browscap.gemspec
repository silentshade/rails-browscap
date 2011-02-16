lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name     = "rails-browscap"
  s.version  = "0.1.0"
  s.author   = "Gilles Devaux"
  s.email    = "gilles.devaux@gmail.com"
  s.homepage = "https://github.com/gilles/rails-browscap"
  s.platform = Gem::Platform::RUBY
  s.summary  = "rails plugin around the broswcap gem"
  s.files    = Dir.glob("{rails,tasks,lib}/**/*") + %w(MIT-LICENSE README.md install.rb uninstall.rb)
  s.add_dependency('browscap', '~>0.1.0')
  s.add_dependency('inifile', '~>0.4.0')
  s.require_path     = "lib"
  s.has_rdoc         = false
  s.extra_rdoc_files = ["README.md"]
end

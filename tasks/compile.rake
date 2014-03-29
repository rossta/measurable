require 'rake/extensiontask'
spec = Gem::Specification.load('measurable.gemspec')

Rake::ExtensionTask.new('euclidean_c', spec) do |ext|
  ext.lib_dir = File.join('lib', 'measurable')
end

require 'rake'
require 'bundler/gem_tasks'
require "rspec/core/rake_task"
require 'rdoc/task'

# Setup the necessary gems, specified in the gemspec.
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

task :default => [:spec]

# Run all the specs.
RSpec::Core::RakeTask.new(:spec)

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "LICENSE", "lib")
  rdoc.generator = "fivefish"
  rdoc.external = true
end

desc "Open IRB with Measurable loaded."
task :console do
  require 'irb'
  require 'irb/completion'
  require 'measurable'
  ARGV.clear
  IRB.start
end

load 'tasks/compile.rake'
load 'tasks/benchmark.rake'

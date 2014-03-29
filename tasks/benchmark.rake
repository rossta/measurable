BENCHMARKS = Dir["#{File.dirname(__FILE__)}/../benchmarks/*.rb"].map do |path|
  File.basename(path, '.rb')
end

namespace :bench do
  BENCHMARKS.each do |feature|
    desc "Run #{feature} benchmarks"
    task(feature){ ruby "benchmarks/#{feature}.rb" }
  end

  task :all do
    BENCHMARKS.each do |feature|
      ruby "benchmarks/#{feature}.rb"
    end
  end
end

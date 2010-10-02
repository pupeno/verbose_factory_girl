require "rubygems"
require "rake"

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "verbose_factory_girl"
    gem.summary = %Q{Like factory girl but much more noisy}
    gem.description = %Q{Print out what factory girl is doing to the console in a format that is right at home with Rails migrations. For some background read http://pupeno.com/blog/generating-sample-data}
    gem.email = "pupeno@pupeno.com"
    gem.homepage = "http://github.com/pupeno/verbose_factory_girl"
    gem.authors = ["J. Pablo Fernández"]
    gem.add_development_dependency "yard", ">= 0"
    gem.add_dependency "factory_girl", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/**/test_*.rb"
  test.verbose = true
end

begin
  require "rcov/rcovtask"
  Rcov::RcovTask.new do |test|
    test.libs << "test"
    test.pattern = "test/**/test_*.rb"
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

begin
  require "reek/adapters/rake_task"
  Reek::RakeTask.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.source_files = "lib/**/*.rb"
  end
rescue LoadError
  task :reek do
    abort "Reek is not available. In order to run reek, you must: sudo gem install reek"
  end
end

begin
  require "roodi"
  require "roodi_task"
  RoodiTask.new do |t|
    t.verbose = false
  end
rescue LoadError
  task :roodi do
    abort "Roodi is not available. In order to run roodi, you must: sudo gem install roodi"
  end
end

task :default => :test

begin
  require "yard"
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

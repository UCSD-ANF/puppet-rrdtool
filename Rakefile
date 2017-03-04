begin
  require 'rubygems'
  require 'puppetlabs_spec_helper/rake_tasks'
  gem 'git', '>=1.2.6'
  require 'git'
  require 'ci/reporter/rake/rspec'
  require 'parallel_tests'
rescue LoadError => e
  STDERR.puts "An error occurred loading dependencies for the Rakefile:"
  STDERR.puts e.message
  STDERR.puts "Please install all dependencies with the `bundle` command first"
  STDERR.puts ["If this error message continues after updating the bundle,",
              "a required library may no longer be compatible"].join(' ')
  # STDERR.puts e.backtrace.inspect
  exit
end

desc 'Generate rdoc files'
task :doc => [:doc_clean] do |t|
  sh "puppet doc --mode rdoc --manifestdir manifests --modulepath ./modules/ --outputdir doc"
end


desc 'Cleanup rdoc files'
task :doc_clean do |t|
  sh "rm -rf doc"
end

desc 'Run parallel spec tests in an existing fixtures directory'
task :parallel_spec_standalone do
  # Based on http://razorconsulting.com.au/parallelising-rspec-puppet.html

  # Select existing test dirs based on the default puppet labs pattern
  # The parallel_test rspec target doesn't handle the pattern argument like a
  # Rake::Task and doesn't appear to work at all. Community workarounds are to
  # manually specify directories and hope that the default _spec matcher works.
  # Caveat is that the directory has to exist or else the parallel_test command
  # will choke.
  dirs = [
    'spec/classes',
    'spec/defines',
    'spec/unit',
    'spec/functions',
    'spec/hosts',
    'spec/integration',
    'spec/types',
  ]
  tdirs = dirs.select do |d|
    Dir.exists?(d)
  end

  ParallelTests::CLI.new.run( [ '--type', 'test', '-t', 'rspec', ] + tdirs )
end

desc 'Run parallel spec tests in a clean fixtures directory'
task :parallel_spec do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:parallel_spec_standalone].invoke
  Rake::Task[:spec_clean].invoke
end

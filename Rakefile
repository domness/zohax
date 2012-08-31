# encoding: utf-8

require 'rubygems'
require 'bundler'
Bundler::GemHelper.install_tasks
require 'rspec/core/rake_task'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "zohoho"
  gem.homepage = "http://github.com/kwhite/zohoho"
  gem.license = "MIT"
  gem.summary = %Q{Simple interface to zoho api}
  gem.description = %Q{Simple interface to zoho api}
  gem.email = "jkentonwhite@gmail.com"
  gem.authors = ["KentonWhite"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

RSpec::Core::RakeTask.new(:spec)

task :test => :spec
task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "zohoho #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

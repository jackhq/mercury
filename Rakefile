require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mercury"
    gem.summary = %Q{Easy Hacking with Haml, Sass, JQuery, CoffeeScript}
    gem.description = %Q{Hack with haml, sass, jquery and coffee-script!}
    gem.email = "thing2@jackhq.com"
    gem.homepage = "http://github.com/jackhq/mercury"
    gem.authors = ["Tom Wilson"]
    gem.add_dependency "sinatra", ">= 1.0.0"
    gem.add_dependency "haml", ">= 3.0.0.beta.1"
    gem.add_dependency "faker", ">= 0"
    gem.add_dependency "bluecloth", ">= 0"
    gem.files = FileList['lib/**/*']
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mercury #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

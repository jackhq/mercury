# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mercury}
  s.version = "0.9.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Wilson"]
  s.date = %q{2010-04-05}
  s.default_executable = %q{mercury}
  s.description = %q{Hack with haml, sass, jquery and coffee-script!}
  s.email = %q{thing2@jackhq.com}
  s.executables = ["mercury"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "lib/mercury.rb",
     "lib/mercury/helpers.rb",
     "lib/mercury/images.rb",
     "lib/public/favicon.ico",
     "lib/public/images/bk_gradient.png",
     "lib/public/javascripts/coffee-script.js",
     "lib/public/javascripts/jquery-1.4.2.min.js",
     "lib/public/javascripts/jquery-ui-1.8.custom.min.js",
     "lib/public/stylesheets/960.css",
     "lib/public/stylesheets/app.css",
     "lib/public/stylesheets/reset.css",
     "lib/public/stylesheets/sass/grid.sass",
     "lib/public/stylesheets/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_flat_75_ffffff_40x100.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_glass_65_ffffff_1x400.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_glass_75_dadada_1x400.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png",
     "lib/public/stylesheets/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png",
     "lib/public/stylesheets/smoothness/images/ui-icons_222222_256x240.png",
     "lib/public/stylesheets/smoothness/images/ui-icons_2e83ff_256x240.png",
     "lib/public/stylesheets/smoothness/images/ui-icons_454545_256x240.png",
     "lib/public/stylesheets/smoothness/images/ui-icons_888888_256x240.png",
     "lib/public/stylesheets/smoothness/images/ui-icons_cd0a0a_256x240.png",
     "lib/public/stylesheets/smoothness/jquery-ui-1.8.custom.css",
     "lib/public/stylesheets/text.css",
     "lib/views/index.haml",
     "lib/views/layout.haml"
  ]
  s.homepage = %q{http://github.com/jackhq/mercury}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Easy Hacking with Haml, Sass, JQuery, CoffeeScript}
  s.test_files = [
    "spec/lib/mercury/helpers_spec.rb",
     "spec/lib/mercury/images_spec.rb",
     "spec/mercury_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<haml>, [">= 3.0.0.beta.1"])
      s.add_runtime_dependency(%q<faker>, [">= 0"])
      s.add_runtime_dependency(%q<bluecloth>, [">= 0"])
      s.add_runtime_dependency(%q<RedCloth>, [">= 4.2.2"])
    else
      s.add_dependency(%q<sinatra>, [">= 1.0.0"])
      s.add_dependency(%q<haml>, [">= 3.0.0.beta.1"])
      s.add_dependency(%q<faker>, [">= 0"])
      s.add_dependency(%q<bluecloth>, [">= 0"])
      s.add_dependency(%q<RedCloth>, [">= 4.2.2"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 1.0.0"])
    s.add_dependency(%q<haml>, [">= 3.0.0.beta.1"])
    s.add_dependency(%q<faker>, [">= 0"])
    s.add_dependency(%q<bluecloth>, [">= 0"])
    s.add_dependency(%q<RedCloth>, [">= 4.2.2"])
  end
end


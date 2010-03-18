# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redline}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Daniels"]
  s.date = %q{2010-03-17}
  s.description = %q{Syncs your AR models with Braintree (Payment Gateway) and offers a lightweight reoccurring billing script}
  s.email = %q{james@marginleft.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/redline.rb",
     "lib/redline/billing/base.rb",
     "lib/redline/customer/base.rb",
     "lib/redline/customer/instance.rb",
     "lib/redline/customer/settings.rb",
     "lib/redline/subscription/base.rb",
     "lib/redline/subscription/instance.rb",
     "lib/redline/subscription/settings.rb",
     "redline.gemspec",
     "spec/billing_spec.rb",
     "spec/customer_spec.rb",
     "spec/db/database.yml",
     "spec/db/models.rb",
     "spec/db/schema.rb",
     "spec/redline_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/subscription_spec.rb"
  ]
  s.homepage = %q{http://github.com/jamesdaniels/redline}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Syncs your AR models with Braintree (Payment Gateway) and offers a lightweight reoccurring billing script}
  s.test_files = [
    "spec/billing_spec.rb",
     "spec/customer_spec.rb",
     "spec/db/models.rb",
     "spec/db/schema.rb",
     "spec/redline_spec.rb",
     "spec/spec_helper.rb",
     "spec/subscription_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<braintree>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<braintree>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<braintree>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end


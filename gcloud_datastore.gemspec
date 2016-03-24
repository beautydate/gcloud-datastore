$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gcloud_datastore/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gcloud-datastore"
  s.version     = GcloudDatastore::VERSION
  s.authors     = ["Fábio Tomio"]
  s.email       = ["fabiotomio@beautydate.com"]
  s.homepage    = "http://www.b2beautygroup.com/"
  s.summary     = "Gcloud Datastore ODM - Object Document Mapping"
  s.description = "Gcloud Datastore is a simple ODM to integrate Gcloud Datastore with Ruby Projects. Extend gcloud gem and is inspired on Mongoid ODM."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "gcloud", '~> 0.6.2'
  s.add_dependency "activemodel", '~> 4.2.5.2'
  
  s.add_development_dependency "rails", "~> 4.2.5.2"
  s.add_development_dependency "sqlite3"
end

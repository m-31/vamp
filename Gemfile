source 'https://rubygems.org'

# Specify your gem's dependencies in vamp.gemspec
gemspec

gem 'extensions'                 if RUBY_VERSION =~ /1\.8\./

# only for local testing but not needed for spec tests
group :test do
  gem 'rake'                     if RUBY_VERSION !~ /^1\./
  gem 'rake',          '~>10'    if RUBY_VERSION =~ /^1\./
end
  

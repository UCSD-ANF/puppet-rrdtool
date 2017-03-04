source 'https://rubygems.org'

### Environment variable version overrrides

# facter
facter_version = ENV.key?('FACTER_VERSION') ? "= #{ENV['FACTER_VERSION']}" : \
  '= 2.4.4' # from puppet enterprise 3.8.5
# puppet
puppet_version = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : \
  '= 3.8.5' # from puppet enterprise 3.8.0, but 3.8.0 not available
# hiera
hiera_version = ENV.key?('HIERA_VERSION') ? "= #{ENV['HIERA_VERSION']}" : \
  '= 1.3.4' # from puppet enterprise 3.8.0
# hiera-puppet
hiera_puppet_version = ENV.key?('HIERA_PUPPET_VERSION') ? \
  "= #{ENV['HIERA_PUPPET_VERSION']}" : '>= 1.0.0' # from puppet enterprise 3.7

### Gem requirements
gem 'json_pure', '< 2.0'
gem 'rake', '<11'
gem 'rspec', '< 3.0.0'
gem 'facter', facter_version
gem 'puppet', puppet_version
gem 'rspec-puppet', '>= 2.0'
gem 'puppet-syntax', :require => false
#gem 'rcov'

## Puppet 2.x does not include hiera.
if puppet_version =~ /^([^0-9]+)?([^\.]|)2(\..*?)$/
  gem 'hiera', hiera_version
  gem 'hiera-puppet', hiera_puppet_version
end

gem 'puppet-lint'
# http://www.camptocamp.com/en/actualite/getting-code-ready-puppet-4/
gem 'puppet-lint-unquoted_string-check'
gem 'puppet-lint-empty_string-check'
gem 'puppet-lint-leading_zero-check'
gem 'puppet-lint-variable_contains_upcase'
gem 'puppet-lint-spaceship_operator_without_tag-check'
#gem 'puppet-lint-absolute_classname-check'
#gem 'puppet-lint-undef_in_function-check'
gem 'puppet-lint-roles_and_profiles-check'

gem 'puppetlabs_spec_helper'
gem 'git', '>= 1.2.6'
gem 'ci_reporter_rspec'

gem 'parallel_tests', '<2.10.0', :require => false

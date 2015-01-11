require 'rubygems'
require 'bundler/setup'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet_blacksmith/rake_tasks'

IGNORE_PATHS = ["spec/**/*.pp", "pkg/**/*.pp"]

PuppetSyntax.exclude_paths = IGNORE_PATHS

PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = IGNORE_PATHS

desc "Validate manifests, templates, and ruby files"
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc "Run syntax, lint, and spec tests."
task :test => [ :syntax, :lint, :spec ]

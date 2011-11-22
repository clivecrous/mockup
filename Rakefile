# Rakefile
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.
require 'rake'
require 'rspec/core/rake_task'


desc "Run all specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*spec.rb'
  unless ENV['NO_RCOV']
    t.rcov = true
    t.rcov_path = 'coverage'
    t.rcov_opts = ['--text-report', '--exclude', 'data/balsamiq-all-controls.xml', '--exclude', "spec/"]
  end
end

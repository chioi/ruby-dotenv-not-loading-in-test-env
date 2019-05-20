# frozen_string_literal: true

require 'rspec'
require 'rack/test'
require 'rspec/core/rake_task'
require 'dotenv/tasks'

task test: :dotenv do
  RSpec::Core::RakeTask.new(:spec).run_task(verbose: true)
end

task :default do
  ruby 'lib/chat_server.rb'
end

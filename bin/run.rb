#!/usr/bin/env ruby
# frozen_string_literal: true
require 'bundler/setup'

STDOUT.sync = true # we want responsive logs
Thread.abort_on_exception = true

loop do
  puts "Running #{ENV.fetch("RAILS_ENV")}"
  sleep 1
end

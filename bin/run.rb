#!/usr/bin/env ruby
# frozen_string_literal: true
require 'bundler/setup'

STDOUT.sync = true # we want responsive logs
require 'rack'

app = Proc.new do |env|
  puts "GOT REQUEST!"
  ['200', {'Content-Type' => 'text/html'}, ['HELLO']]
end

Rack::Handler::WEBrick.run app

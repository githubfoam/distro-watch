#!/usr/bin/env ruby

require 'yaml'
require 'json'

configuration = YAML.load($stdin)
$stdout.puts(configuration.to_json)

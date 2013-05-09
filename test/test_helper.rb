ENV["ENV"] = "test"
require 'test/unit'

require "bundler/setup"
Bundler.require :default, :test

require_relative '../lib/imdb_api'

FactoryGirl.find_definitions

class ActiveSupport::TestCase
end

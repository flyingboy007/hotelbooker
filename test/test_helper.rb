require "bundler"
Bundler.require
Bundler.require :test

ENV["APP_ENV"] = "test"


require "config"
require "factories"

require 'minitest/reporters'
DatabaseCleaner.strategy = :transaction



reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class Minitest::Test
  include FactoryGirl::Syntax::Methods
end

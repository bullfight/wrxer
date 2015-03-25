$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wrxer'
require 'pry'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end


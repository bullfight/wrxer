require "wrxer/version"
require 'nokogiri'

require 'wrxer/attribute'
require 'wrxer/wrxer_object'
require 'wrxer/post'

require 'wrxer/parser'

module Wrxer
  def self.parse(file)
    Parser.new(file)
  end
end

require "wrxer/version"
require 'nokogiri'
require 'time'


require 'wrxer/coercion'
require 'wrxer/attribute'
require 'wrxer/wrxer_object'
require 'wrxer/wrxer_collection'

require 'wrxer/category'
require 'wrxer/post'
require 'wrxer/post_collection'
require 'wrxer/author'
require 'wrxer/document'

require 'wrxer/parser'

module Wrxer
  def self.parse(file)
    Parser.new(file)
  end
end

require "wrxer/version"
require 'nokogiri'
require 'time'
require 'json'
require 'open-uri'


require 'wrxer/coercion'
require 'wrxer/attribute'
require 'wrxer/wrxer_object'
require 'wrxer/wrxer_collection'

require 'wrxer/category'
require 'wrxer/postmeta'
require 'wrxer/postmeta_collection'
require 'wrxer/comment'
require 'wrxer/comment_collection'

require 'wrxer/post'
require 'wrxer/post_collection'
require 'wrxer/author'
require 'wrxer/image'
require 'wrxer/document'

require 'wrxer/parser'
require 'wrxer/uri_parser'

module Wrxer
  def self.parse(file)
    Parser.new(file).call
  end

  def self.parse_uri(uri)
    URIParser.new(uri).call
  end
end

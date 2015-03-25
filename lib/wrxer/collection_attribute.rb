module Wrxer
  class CollectionAttribute < Attribute
    def call(document)
      parser.call(document)
    end
  end
end

module Wrxer
  class Postmeta < WrxerObject
    xpath 'postmeta'
    attribute :key, "wp:meta_key"
    attribute :value, "wp:meta_value", IntegerAttribute
  end
end

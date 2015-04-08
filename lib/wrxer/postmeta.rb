module Wrxer
  class Postmeta
    include Model
    xpath 'postmeta'
    attribute :key, "wp:meta_key"
    attribute :value, "wp:meta_value", IntegerAttribute
  end
end

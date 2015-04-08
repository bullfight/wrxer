module Wrxer
  class PostmetaCollection
    include Collection
    xpath "item"
    collection :postmeta, "//wp:postmeta", Postmeta
  end
end

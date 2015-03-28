module Wrxer
  class PostmetaCollection < WrxerCollection
    xpath "item"
    collection :postmeta, "//wp:postmeta", Postmeta
  end
end

module Wrxer
  class PostCollection < WrxerCollection
    xpath "//channel"
    collection :posts, "//item", Post
  end
end

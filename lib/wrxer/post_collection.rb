module Wrxer
  class PostCollection < WrxerCollection
    root "//channel"
    collection :posts, "//item", Post
  end
end

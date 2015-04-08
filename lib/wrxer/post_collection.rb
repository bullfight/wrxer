module Wrxer
  class PostCollection
    include Collection

    xpath "//channel"
    collection :posts, "//item", Post
  end
end

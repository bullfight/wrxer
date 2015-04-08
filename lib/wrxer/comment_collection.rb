module Wrxer
  class CommentCollection
    include Collection
    xpath "item"
    collection :comments, "//wp:comment", Comment
  end
end


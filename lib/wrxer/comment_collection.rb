module Wrxer
  class CommentCollection < WrxerCollection
    xpath "item"
    collection :comments, "//wp:comment", Comment
  end
end


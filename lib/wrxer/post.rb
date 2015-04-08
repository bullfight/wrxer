module Wrxer
  class Post
    include Wrxer::Model
    xpath "item"
    attribute :title
    attribute :link
    attribute :pub_date, "pubDate", TimeAttribute
    attribute :creator, "dc:creator"
    attribute :content, "content:encoded"
    attribute :excerpt, "excerpt:encoded"
    attribute :id, "wp:post_id", IntegerAttribute
    attribute :published_at, 'wp:post_date_gmt', TimeAttribute
    attribute :comment_status, "wp:comment_status"
    attribute :ping_status, "wp:ping_status"
    attribute :name, 'wp:post_name'
    attribute :status, "wp:status"
    attribute :parent, "wp:post_parent", IntegerAttribute
    attribute :menu_order, "wp:menu_order", IntegerAttribute
    attribute :type, "wp:post_type"
    attribute :is_sticky, "wp:is_sticky", IntegerAttribute
    attribute :category, "category", Category
    attribute :postmetas, 'item', PostmetaCollection
    attribute :comments, 'item', CommentCollection
  end
end

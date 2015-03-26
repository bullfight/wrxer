module Wrxer
  class Post < WrxerObject
    root "item"
    attribute :id, "wp:post_id", IntegerAttribute
    attribute :title, "title"
    attribute :content, "content:encoded"
    attribute :excerpt, "excerpt:encoded"
    attribute :slug, 'wp:post_name'
    attribute :published_at, 'wp:post_date_gmt', TimeAttribute
  end
end

module Wrxer
  class Comment < WrxerObject
    xpath 'comment'
    attribute :id, IntegerAttribute
    attribute :author, "wp:comment_author"
    attribute :email, "wp:author_email"
    attribute :url, "wp:author_url"
    attribute :ip, "wp:author_ip"
    attribute :published_at, "wp:comment_date_gmt", TimeAttribute
    attribute :content, "wp:comment_content"
    attribute :approved, "wp:comment_approved", IntegerAttribute
    attribute :type, "wp:comment_type"
    attribute :parent, "wp:comment_parent", IntegerAttribute
    attribute :user_id, "wp:comment_user_id", IntegerAttribute
  end
end

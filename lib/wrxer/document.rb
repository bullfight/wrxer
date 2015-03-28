module Wrxer
  class Document < WrxerObject
    xpath '//channel'
    attribute :title
    attribute :link
    attribute :description
    attribute :pub_date, "pubDate", TimeAttribute
    attribute :language
    attribute :wrx_version, "wp:wrx_version"
    attribute :base_site_url, "wp:base_site_url"
    attribute :base_blog_url, "wp:base_blog_url"
    attribute :author, "wp:author", Author
    attribute :generator
    attribute :posts, "item", PostCollection
  end
end

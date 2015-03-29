# Wrxer

This gem is a simple parser for Wordpress eXtended RSS.  At the moment it only
supports a few of the exported objects and attributes that I find useful.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wrxer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wrxer

## Usage

Wrxer can be user to parse posts from a Wordpress export. Take a look at
`lib/wrxer/post` to see which attributes are supported.

```ruby
document = Wrxer.parse("export.xml")
=> #<Wrxer::Document:0x3fd8091d3488> Attributes: {
  "title": "Wrxer News",
  "link": "https://wrxernews.wordpress.com",
  "description": "The Most Reliable Source For Wrxer News Since 2007.",
  "pub_date": "2015-03-24 21:18:58 +0000",
  "language": "en",
  "wrx_version": null,
  "base_site_url": "http://wordpress.com/",
  "base_blog_url": "https://wrxernews.wordpress.com",
  "author": {
    "login": "wrxernews",
    "email": null,
    "display_name": "Wrxer News",
    "first_name": "",
    "last_name": ""
  },
  "generator": "http://wordpress.com/",
  "image": {
    "url": "https://secure.gravatar.com/blavatar/foobar",
    "title": " » Wrxer News",
    "link": "https://wrxernews.wordpress.com"
  },
  "posts": {
    "data": "#<Enumerator::Lazy:0x007fb01303ee20>"
  }
}

post = document.posts.first
=> #<Wrxer::Post:0x3fd4799693ac> Attributes: {
  "title": "Welcome To Wrxer News.",
  "link": "https://wrxernews.wordpress.com/2007/11/17/welcome-to-wrxer-news/",
  "pub_date": "2007-11-17 21:30:51 +0000",
  "creator": "wrxernews",
  "content": "Welcome to <strong>Wrxer News</strong> - The most up-to-date and reliable source for Wrxer news.",
  "excerpt": "Excerpt Text",
  "id": 3,
  "published_at": "2007-11-17 21:30:51 -0800",
  "comment_status": "open",
  "ping_status": "open",
  "name": "welcome-to-wrxer-news",
  "status": "publish",
  "parent": 0,
  "menu_order": 0,
  "type": "post",
  "is_sticky": 0,
  "category": {
    "domain": "category",
    "nicename": "wrxer-news",
    "body": "Wrxer News"
  },
  "postmetas": {
    "data": "#<Enumerator::Lazy:0x007fa8f315a970>"
  },
  "comments": {
    "data": "#<Enumerator::Lazy:0x007fa8f315a3f8>"
  }
}
post.title
=> "Welcome To Wrxer News."

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wrxer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

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
parser = Wrxer.parse("export.xml")
=> <Wrxer::Parser ...>
post = parser.posts.first
=> <Wrxer::Post title: "Foo" ..>
post.title "Foo Bar Baz"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wrxer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

module Wrxer
  class Author
    include Model
    xpath 'wp:author'
    attribute :login, "wp:author_login"
    attribute :email, "wp:autor_email"
    attribute :display_name, "wp:author_display_name"
    attribute :first_name, "wp:author_first_name"
    attribute :last_name, "wp:author_last_name"
  end
end

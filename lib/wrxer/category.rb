module Wrxer
  class Category
    include Model
    xpath 'category'
    attribute :domain, 'domain', ElementAttribute
    attribute :nicename, 'nicename', ElementAttribute
    attribute :body, nil, ChildAttribute
  end
end

module Wrxer
  class Category < WrxerObject
    root 'category'
    attribute :domain, 'domain', ElementAttribute
    attribute :nicename, 'nicename', ElementAttribute
    attribute :body, nil, ChildAttribute
  end
end

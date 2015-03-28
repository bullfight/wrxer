module Wrxer
  class Category < WrxerObject
    xpath 'category'
    attribute :domain, 'domain', ElementAttribute
    attribute :nicename, 'nicename', ElementAttribute
    attribute :body, nil, ChildAttribute
  end
end

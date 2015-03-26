module Wrxer
  class Attribute < Struct.new(:name, :xpath, :parser)
    def call(document, params = {})
      if parser
        parser.call(document, {xpath: xpath})
      else
        document.at_xpath(xpath).text
      end
    end

    end
  end
end

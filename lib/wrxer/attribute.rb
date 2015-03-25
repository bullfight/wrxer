module Wrxer
  class Attribute < Struct.new(:name, :xpath, :parser)
    def call(document)
      if parser
        parser.call(text(document))
      else
        text(document)
      end
    end

    def text(document)
      document.at_xpath(xpath).text
    end
  end
end

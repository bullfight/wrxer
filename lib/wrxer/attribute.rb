require 'time'

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

  class IntegerAttribute
    def self.call(document, params = {})
      Integer(document.at_xpath(params[:xpath]).text)
    end
  end

  class TimeAttribute
    def self.call(document, params = {})
      Time.parse(document.at_xpath(params[:xpath]).text)
    end
  end

    end
  end
end

require 'time'

module Wrxer
  class Attribute < Struct.new(:name, :xpath, :parser)
    def call(document, params = {})
      parser.call(document, { xpath: xpath })
    end
  end

  class TextAttribute
    def self.call(document, params = {})
      document.at_xpath(params[:xpath]).text
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

  class ElementAttribute
    def self.call(document, params = {})
      document.attributes[params[:xpath].to_s].value
    end
  end

  class ChildAttribute
    def self.call(document, params = {})
      document.children.text
    end
  end
end

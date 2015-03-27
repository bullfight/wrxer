require 'time'

module Wrxer
  class Attribute < Struct.new(:name, :xpath, :parser)
    def call(document, params = {})
      parser.call(document, { xpath: xpath })
    end
  end

  class TextAttribute
    def self.call(document, params = {})
      value = document.at_xpath(params[:xpath])
      value.nil? ? nil : value.text
    end
  end

  class IntegerAttribute
    def self.call(document, params = {})
      value = document.at_xpath(params[:xpath])
      value.nil? ? nil : Integer(value.text)
    end
  end

  class TimeAttribute
    def self.call(document, params = {})
      value = document.at_xpath(params[:xpath])
      value.nil? ? nil : Time.parse(value.text)
    end
  end

  class ElementAttribute
    def self.call(document, params = {})
      element = document.attributes[params[:xpath].to_s]
      element.nil? ? nil : element.value
    end
  end

  class ChildAttribute
    def self.call(document, params = {})
      child = document.children
      child.empty? ? nil : child.text
    end
  end
end

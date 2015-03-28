module Wrxer
  class Coercion
    def self.xpath(value)
      @xpath = value
    end

    def self.call(document, params = {})
      root = @xpath || params[:xpath]
      unless document.name == root
        document = document.at_xpath(root)
      end

      document.nil? ? nil : self.coerce(document)
    end

    def self.coerce(document)
      self.new(document)
    end
  end

  class TextAttribute < Coercion
    def self.coerce(document)
      document.text
    end
  end

  class IntegerAttribute < Coercion
    def self.coerce(document)
      Integer(document.text)
    end
  end

  class TimeAttribute < Coercion
    def self.coerce(document)
      Time.parse(document.text)
    end
  end

  class ElementAttribute < Coercion
    def self.call(document, params = {})
      element = document.attributes[params[:xpath].to_s]
      element.nil? ? nil : self.coerce(element)
    end

    def self.coerce(document)
      document.value
    end
  end

  class ChildAttribute < Coercion
    def self.call(document, params = {})
      child = document.children
      child.empty? ? nil : self.coerce(child)
    end

    def self.coerce(document)
      document.text
    end
  end
end

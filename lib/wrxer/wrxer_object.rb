module Wrxer
  class WrxerObject
    include Enumerable
    def self.attribute(value, xpath, parser = nil)
      @attributes ||= []
      @attributes << Attribute.new(value, xpath, parser)
    end

    def self.inherited(subclass)
      super
      subclass.instance_variable_set(:@attributes, @attributes)
    end

    attr_reader :document
    def initialize(document)
      @document = document
    end

    def attributes
      self.class.instance_variable_get(:@attributes)
    end

    def method_missing(name, *args)
      attributes.select { |item| item.name == name }.first.call(document)
    rescue NoMethodError => e
      raise NoMethodError.new("undefined method '#{name}' for #{self.class}")
    end

    def each(&block)
      document.each do |item|
        block.call(self.new(item))
      end
    end
  end
end

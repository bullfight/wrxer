module Wrxer
  class WrxerObject
    include Enumerable
    def self.root(value)
      @root = value
    end

    def self.attribute(value, xpath, parser = nil)
      @attributes ||= []
      @attributes << Attribute.new(value, xpath, parser)
    end

    def self.inherited(subclass)
      super
      subclass.instance_variable_set(:@root, @root)
      subclass.instance_variable_set(:@attributes, @attributes)
    end

    attr_reader :document, :root
    def initialize(document)
      @root = self.class.instance_variable_get(:@root)
      @document = document.xpath(@root)
    end

    def attributes
      self.class.instance_variable_get(:@attributes)
    end

    def [](key)
      attributes.select { |item| item.name == key.to_sym}.first.call(document)
    end

    def method_missing(name, *args)
      attributes.select { |item| item.name == name }.first.call(document)
    rescue NoMethodError => e
      raise NoMethodError.new("undefined method '#{name}' for #{self.class}")
    end

    def each(&block)
      document.each do |item|
        block.call(self.class.new(item))
      end
    end

    def to_s
      to_hash
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}> Attributes: " + to_hash.to_s
    end

    def to_hash
      attributes.inject({}) do |acc, (key, value)|
        acc[key.name] = key.call(document)
        acc
      end
    end
  end
end

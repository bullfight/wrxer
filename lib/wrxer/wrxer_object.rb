module Wrxer
  class WrxerObject < Coercion
    def self.attribute(name, xpath = nil, coercion = TextAttribute)
      @attributes ||= []
      @attributes << Attribute.new(name, xpath || name.to_s, coercion)
    end

    def self.inherited(subclass)
      subclass.instance_variable_set(:@attributes, @attributes)
      super
    end

    attr_reader :document
    def initialize(document)
      @document = document
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

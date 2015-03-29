module Wrxer

  class WrxerCollection < WrxerObject
    include Enumerable

    def self.call(document, params = {})
      root = @xpath || params[:xpath]
      unless document.name == root
        document = document.xpath(root)
      end

      document.nil? ? nil : self.coerce(document)
    end

    def self.collection(value, xpath, parser)
      @collection = Attribute.new(value, xpath, parser)
    end

    def self.inherited(subclass)
      subclass.instance_variable_set(:@collection, @collection)
      super
    end

    def collection
      self.class.instance_variable_get(:@collection)
    end

    def each(&block)
      document.xpath(collection.xpath).each do |item|
        block.call(
          collection.call(item)
        )
      end
    end

    def data
      lazy
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}> { data: #{data} } }"
    end

    def to_hash
      { data: data }
    end
  end
end

module Wrxer

  class WrxerCollection < WrxerObject
    include Enumerable

    def self.collection(value, xpath, parser)
      @collection = CollectionAttribute.new(value, xpath, parser)
    end

    def self.inherited(subclass)
      super
      subclass.instance_variable_set(:@collection, @collection)
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

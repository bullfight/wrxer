module Wrxer
  class URIParser
    attr_reader :uri, :xml_document, :document
    def initialize(uri)
      @uri = URI.parse(uri)

      @uri.open do |file|
        @xml_document = Nokogiri::XML(file.read)
      end
    end

    def call
      @document ||= Document.call(@xml_document)
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}> { uri: #{@uri.to_s}, xml_document: #{@xml_document.class} }"
    end
  end
end

module Wrxer
  class Parser
    attr_reader :filename, :xml_document, :document
    def initialize(filename)
      @filename = filename

      File.open(filename) do |file|
        @xml_document = Nokogiri::XML(file)
      end
    end

    def call
      @document ||= Document.call(@xml_document)
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}> { filename: #{@filename.to_path}, xml_document: #{@xml_document.class} }"
    end
  end
end

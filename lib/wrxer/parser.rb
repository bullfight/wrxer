module Wrxer
  class Parser
    attr_reader :filename, :document
    def initialize(filename)
      @filename = filename
      File.open(filename) do |file|
        @document = Nokogiri::XML(file)
      end
    end

    def posts
      @posts ||= PostCollection.new(document).lazy
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}> { filename: #{@filename.to_path}, document: #{@document.class} }"
    end
  end
end

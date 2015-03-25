module Wrxer
  class Parser
    attr_reader :filename, :document
    def initialize(filename)
      @filename = filename
      File.open(filename) do |file|
        @document = Nokogiri::XML(file)
      end
    end

    def call
    end
  end
end

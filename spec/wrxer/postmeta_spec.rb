require 'spec_helper'

describe Wrxer::Postmeta do
  describe "valid document" do
    let(:filename) { fixture('wrx.xml') }
    let(:document) { Nokogiri::XML(filename.read).xpath('//channel').at_xpath('item').at_xpath('wp:postmeta')}
    subject { described_class.call(document) }

    it 'has a key' do
      expect(subject.key).to eq "_wpas_skip_4017882"
    end

    it 'has a value' do
      expect(subject.value).to eq 1
    end
  end

end

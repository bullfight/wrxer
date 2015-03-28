require 'spec_helper'

describe Wrxer::PostmetaCollection do
  describe "valid document" do
    let(:filename) { fixture('wrx.xml') }
    let(:document) { Nokogiri::XML(filename.read).xpath('//channel').at_xpath('item') }
    subject { described_class.call(document) }

    it 'has an enumerator' do
      expect(subject.data).to be_an Enumerator
    end

    it 'returns a postmeta' do
      expect(subject.first).to be_a Wrxer::Postmeta
    end
  end
end

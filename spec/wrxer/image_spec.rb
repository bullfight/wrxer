require 'spec_helper'

describe Wrxer::Image do
  describe "valid document" do
    let(:filename) { fixture('wrx.xml') }
    let(:document) { Nokogiri::XML(filename.read).at_xpath('//channel') }
    subject { described_class.call(document) }

    it 'has a url' do
      expect(subject.url).to eq "https://secure.gravatar.com/blavatar/foobar"
    end
  end
end

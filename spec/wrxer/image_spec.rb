require 'spec_helper'

describe Wrxer::Image do
  describe "valid document" do
    let(:filename) { fixture('wrx.xml') }
    let(:document) { Nokogiri::XML(filename.read).at_xpath('//channel') }
    subject { described_class.call(document) }

    it 'has a url' do
      expect(subject.url).to eq "https://secure.gravatar.com/blavatar/ae186272310650dd8c5a1d96d189af20?s=96&d=https%3A%2F%2Fs2.wp.com%2Fi%2Fbuttonw-com.png"
    end
  end
end

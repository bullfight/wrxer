require 'spec_helper'

describe Wrxer::Author do
  describe "valid document" do
    let(:filename) { fixture('wrx.xml') }
    let(:document) { Nokogiri::XML(filename.read).at_xpath('//channel') }
    subject { described_class.call(document) }

    it 'has a login' do
      expect(subject.login).to eq "wrxernews"
    end
  end
end

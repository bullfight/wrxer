require 'spec_helper'

describe Wrxer::Category do
  let(:filename) { fixture('wrx.xml') }
  let(:document) { Nokogiri::XML(filename.read).xpath('//channel').at_xpath('item').at_xpath('category') }
  subject { described_class.new(document) }

  it 'has a domain' do
    expect(subject.domain).to eq "category"
  end

  it 'has a nicename' do
    expect(subject.nicename).to eq "avenged-sevenfold"
  end

  it 'has a body' do
    expect(subject.body).to eq "Avenged Sevenfold"
  end

end

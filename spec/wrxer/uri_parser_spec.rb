require 'spec_helper'

describe Wrxer::URIParser do
  let(:uri) { "https://raw.githubusercontent.com/bullfight/wrxer/master/spec/fixtures/wrx.xml" }
  subject { described_class.new(uri) }

  it 'loads xml document' do
    expect(subject).to be_an Wrxer::URIParser
  end

  it 'returns a wrxer document' do
    expect(subject.call).to be_an Wrxer::Document
  end
end

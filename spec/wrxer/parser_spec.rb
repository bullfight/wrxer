require 'spec_helper'

describe Wrxer::Parser do
  let(:filename) { fixture('wrx.xml') }
  subject { described_class.new(filename) }

  it 'loads xml document' do
    expect(subject).to be_an Wrxer::Parser
  end

  it 'returns a wrxer document' do
    expect(subject.call).to be_an Wrxer::Document
  end
end

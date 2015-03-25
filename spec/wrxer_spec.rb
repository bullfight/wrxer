require 'spec_helper'

describe Wrxer do
  let(:filename) { fixture('wrx.xml') }
  subject { described_class }

  it 'has a version number' do
    expect(Wrxer::VERSION).not_to be nil
  end

  it 'parses a file' do
    expect(subject.parse(filename)).to be_an Wrxer::Parser
  end
end

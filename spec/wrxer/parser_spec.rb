require 'spec_helper'

describe Wrxer::Parser do
  let(:filename) { fixture('wrx.xml') }
  subject { described_class.new(filename) }

  it 'loads xml document' do
    expect(subject.document).to be_an Nokogiri::XML::Document
  end

  it 'parses posts' do
    expect(subject.posts.first).to be_an Wrxer::Post
  end
end

require 'spec_helper'

describe Wrxer::PostCollection do
  let(:filename) { fixture('wrx.xml') }
  let(:document) { Nokogiri::XML(filename.read) }
  subject { described_class.call(document) }

  describe 'collection' do
    it 'has an enumerator' do
      expect(subject.data).to be_an Enumerator
    end

    it 'returns a post' do
      expect(subject.first).to be_a Wrxer::Post
    end

    it 'returns first post' do
      expect(subject.first.title).to eq "Welcome To Wrxer News."
    end

    it 'returns second post' do
      expect(subject.entries[1].title).to eq "Wrxer on the Radio"
    end
  end
end

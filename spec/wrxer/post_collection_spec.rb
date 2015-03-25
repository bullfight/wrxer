require 'spec_helper'

describe Wrxer::PostCollection do
  let(:filename) { fixture('wrx.xml') }
  let(:document) { Nokogiri::XML(filename.read) }
  subject { described_class.new(document) }

  describe 'collection' do
    it 'has an enumerator' do
      expect(subject.data).to be_an Enumerator
    end

    it 'returns a post' do
      expect(subject.first).to be_a Wrxer::Post
    end

    it 'returns first post' do
      expect(subject.first.title).to eq "Welcome To Deathbat News."
    end

    it 'returns second post' do
      expect(subject[1].title).to eq "Avenged Sevenfold On Rockline Radio."
    end
  end
end

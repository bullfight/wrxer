require 'spec_helper'

describe Wrxer::Document do
  describe "valid document" do
    let(:filename) { fixture('wrx.xml') }
    let(:document) { Nokogiri::XML(filename.read) }
    subject { described_class.call(document) }

    it 'has a title' do
      expect(subject.title).to eq "Wrxer News"
    end

    it 'has a link' do
      expect(subject.link).to eq "https://wrxernews.wordpress.com"
    end

    it 'has an author' do
      expect(subject.author).to be_a Wrxer::Author
    end

    it 'has an image' do
      expect(subject.image).to be_a Wrxer::Image
    end

    it 'has posts' do
      expect(subject.posts.first).to be_a Wrxer::Post
    end
  end
end

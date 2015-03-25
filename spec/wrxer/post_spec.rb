require 'spec_helper'

describe Wrxer::Post do
  let(:filename) { fixture('wrx.xml') }
  let(:document) { Nokogiri::XML(filename.read).xpath('//channel') }
  subject { described_class.new(document) }

  it 'has a title' do
    expect(subject.title).to eq "Welcome To Deathbat News."
  end

  it 'has a content' do
    expect(subject.content).to match /Welcome to/
  end

  it 'has an excerpt' do
    expect(subject.excerpt).to eq "Excerpt Text"
  end

  it 'has a slug' do
    expect(subject.slug).to eq "welcome-to-deathbat-news"
  end

  it 'has a post date' do
    expect(subject.published_at).to eq Time.parse("2007-11-17 21:30:51")
  end

  it 'does not have a not foo' do
    expect { subject.foo }.to raise_error(
      NoMethodError, "undefined method 'foo' for Wrxer::Post")
  end
end

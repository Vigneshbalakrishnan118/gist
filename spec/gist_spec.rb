require 'spec_helper'

RSpec.describe Gist do
  it 'has a version number' do
    expect(Gist::VERSION).to eq("0.1.0")
  end
end
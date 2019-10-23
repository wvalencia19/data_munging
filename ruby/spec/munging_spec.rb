require 'spec_helper'
require_relative '../munging'
require 'byebug'

describe Munging do
  subject { described_class.new }
  context '#find_smallest_temperature' do
    let(:smallest_temperature) { subject.find_smallest_temperature }

    it 'returns the smallest temperature spread' do
      expect(smallest_temperature).to eq(['9', 32])
    end
  end
end

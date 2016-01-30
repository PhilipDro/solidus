require 'spec_helper'
require 'spree/testing_support/factories/address_factory'

RSpec.describe 'address factory' do
  let(:factory_class) { Spree::Address }

  describe 'plain address' do
    let(:factory) { :address }

    it_behaves_like 'a working factory'
  end

  describe 'ship_address' do
    let(:factory) { :ship_address }

    it_behaves_like 'a working factory'
  end

  describe 'bill address' do
    let(:factory) { :bill_address }

    it_behaves_like 'a working factory'
  end

  describe 'when passing in a country iso code' do
    subject { build(:address, country_iso_code: "RO") }

    it 'creates a valid address with actually valid data' do
      expect(subject).to be_valid
    end
  end

  describe 'when passing in a state and country' do
    subject { build(:address, country_iso_code: country_iso_code, state_code: state_code) }

    context 'when the country has a state with proper code' do
      let(:country_iso_code) { "US" }
      let(:state_code) { "NY" }

      it 'works' do
        expect(subject).to be_valid
        expect(subject.state.abbr).to eq("NY")
        expect(subject.country.iso).to eq("US")
      end
    end
  end
end

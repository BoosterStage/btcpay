# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Helpers::ApiKeys do
  let(:client) { build(:client) }
  let(:base_subject) { described_class.new(client: client) }

  let(:options) { { permissions: %w[unrestricted], application_name: 'foobar' } }

  context '#authorize' do
    subject { base_subject.authorize }

    describe 'GET #html', :vcr do
      let(:response) { subject.html(**options) }

      it do
        expect(subject).to be_a(BtcPay::Client::Helpers::ApiKeys::Authorize)
        expect(response).to be_success
      end
    end

    describe '#link', :vcr do
      let(:response) { subject.link(**options) }

      it do
        expect(subject).to be_a(BtcPay::Client::Helpers::ApiKeys::Authorize)
        expect(response).to eq('http://localhost:49392/api-keys/authorize?applicationName=foobar&permissions[]=unrestricted&selectiveStores=false&strict=true')
      end
    end
  end
end

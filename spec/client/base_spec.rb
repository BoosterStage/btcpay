# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Base do
  let(:config) { build(:config) }
  let(:subject) { described_class.new(config: config) }

  describe 'resources' do
    it { expect(subject.api_keys).to be_a(BtcPay::Client::Api::ApiKeys) }
    it { expect(subject.api_keys_helper).to be_a(BtcPay::Client::Helpers::ApiKeys) }
    it { expect(subject.health).to be_a(BtcPay::Client::Api::Health) }
    it { expect(subject.lightning.node).to be_a(BtcPay::Client::Api::LightningNode) }
    it { expect(subject.pull_payments).to be_a(BtcPay::Client::Api::PullPayments) }
    it { expect(subject.server).to be_a(BtcPay::Client::Api::Server) }
    it { expect(subject.store).to be_a(BtcPay::Client::Api::Store) }
    it { expect(subject.store.payment_requests).to be_a(BtcPay::Client::Api::StorePaymentRequests) }
    it { expect(subject.store.payouts).to be_a(BtcPay::Client::Api::StorePayouts) }
    it { expect(subject.store.pull_payments).to be_a(BtcPay::Client::Api::StorePullPayments) }
    it { expect(subject.users).to be_a(BtcPay::Client::Api::Users) }
  end

  describe 'requests' do
    let(:path) { '/' }
    let(:response) { double('response') }
    let(:body) { { data: { id: 1 } } }

    before do
      allow(RestClient::Request).to receive(:execute).and_return(response)
      allow(response).to receive(:body).and_return(body.to_json)
      allow(response).to receive(:headers).and_return({})
      allow(response).to receive(:code).and_return(200)
    end

    context '#get' do
      it 'returns successful status response' do
        expect(response).to receive(:code).at_least(:once).and_return(200)

        status = subject.get(path)
        expect(status.success?).to eq(true)
      end

      context 'error' do
        it 'returns failure status response' do
          expect(response).to receive(:code).at_least(:once).and_return(400)

          status = subject.get(path)
          expect(status.failure?).to eq(true)
        end
      end
    end

    context '#post' do
      it 'returns successful status response' do
        expect(response).to receive(:code).at_least(:once).and_return(200)

        status = subject.post(path, payload: {})
        expect(status.success?).to eq(true)
      end

      context 'error' do
        it 'returns failure status response' do
          expect(response).to receive(:code).at_least(:once).and_return(400)

          status = subject.post(path, payload: {})
          expect(status.failure?).to eq(true)
        end
      end
    end
  end
end

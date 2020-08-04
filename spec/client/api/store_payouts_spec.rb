# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::StorePayouts, :vcr do
  let(:store_id) { 'EiGimqCJGwRGkCL8DbdeArVApkvHZdaZARofiSApKdpQ' }
  let(:payout_id) { '2aZ1fde5X1QHpVTcMSbuqmr9B78m' }
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'POST #approve' do
    let(:payload) { build(:store_payment_requests_payload) }
    let(:response) { subject.approve(store_id, payout_id, payload) }

    it { expect(response).to be_success }
  end

  describe 'DELETE #delete' do
    let(:payout_id) { '2aZ1fde5X1QHpVTcMSbuqmr9B78m' }
    let(:response) { subject.delete(store_id, payout_id) }

    it { expect(response).to be_success }
  end
end

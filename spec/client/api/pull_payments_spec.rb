# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::PullPayments, :vcr do
  let(:pull_payment_id) { 'emenWTiqGdphbmbegTiRAe87kjX' }
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #get' do
    let(:response) { subject.get(pull_payment_id) }

    it { expect(response).to be_success }
  end

  describe 'GET #payouts' do
    let(:response) { subject.payouts(pull_payment_id) }

    it { expect(response).to be_success }
  end

  describe 'POST #create_payout' do
    let(:payload) { build(:pull_payments_payout_payload) }
    let(:response) { subject.create_payout(pull_payment_id, payload) }

    it { expect(response).to be_success }
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::StorePullPayments, :vcr do
  let(:store_id) { 'EiGimqCJGwRGkCL8DbdeArVApkvHZdaZARofiSApKdpQ' }
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #all' do
    let(:response) { subject.all(store_id) }

    it { expect(response).to be_success }
  end

  describe 'POST #create' do
    let(:payload) { build(:store_pull_payments_payload) }
    let(:response) { subject.create(store_id, payload) }

    it { expect(response).to be_success }
  end

  describe 'DELETE #delete' do
    let(:request_id) { '3gedGdcqeiFNR5j4SKD6tcD4T1nq' }
    let(:response) { subject.delete(store_id, request_id) }

    it { expect(response).to be_success }
  end
end

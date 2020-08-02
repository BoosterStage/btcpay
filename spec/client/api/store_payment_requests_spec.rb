# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::StorePaymentRequests, :vcr do
  let(:store_id) { 'EiGimqCJGwRGkCL8DbdeArVApkvHZdaZARofiSApKdpQ' }
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #all' do
    let(:response) { subject.all(store_id) }

    it { expect(response).to be_success }
  end

  describe 'POST #create' do
    let(:payload) { build(:store_payment_requests_payload) }
    let(:response) { subject.create(store_id, payload) }

    it { expect(response).to be_success }
  end

  describe 'GET #get' do
    let(:request_id) { '007b9ad8-49f1-4b99-942b-3917ceb20eef' }
    let(:response) { subject.get(store_id, request_id) }

    it { expect(response).to be_success }
  end

  describe 'DELETE #delete' do
    let(:request_id) { '007b9ad8-49f1-4b99-942b-3917ceb20eef' }
    let(:response) { subject.delete(store_id, request_id) }

    it { expect(response).to be_success }
  end

  describe 'PUT #update' do
    let(:request_id) { 'bb592ecf-c06e-4d62-8421-f7089d32be47' }
    let(:payload) { build(:store_payment_requests_payload) }
    let(:response) { subject.update(store_id, request_id, payload) }

    it { expect(response).to be_success }
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::ApiKeys, :vcr do
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #current' do
    let(:response) { subject.current }

    it { expect(response).to be_success }
  end

  describe 'POST #create' do
    let(:payload) { build(:api_keys_payload) }
    let(:response) { subject.create(payload) }

    it { expect(response).to be_success }
  end

  describe 'DELETE #revoke(:key)' do
    let(:revoke_api_key) { '75914ce4702f1f72f4bdfbddccf939b50947262d' }
    let(:response) { subject.revoke(revoke_api_key) }

    it { expect(response).to be_success }
  end

  describe 'DELETE #revoke!' do
    let(:client) { build(:client, config: build(:config, auth_token: '76e5404d713cfa3106607dc937315dd5f929bd29')) }
    let(:response) { subject.revoke! }

    it { expect(response).to be_success }
  end
end

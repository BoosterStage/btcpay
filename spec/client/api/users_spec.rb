# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::Users, :vcr do
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #me' do
    let(:response) { subject.me }

    it { expect(response).to be_success }
  end

  describe 'POST #create' do
    let(:payload) { build(:users_payload) }
    let(:response) { subject.create(payload) }

    it { expect(response).to be_success }
  end
end

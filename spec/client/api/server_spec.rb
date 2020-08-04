# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::Server, :vcr do
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #info' do
    let(:response) { subject.info }

    it { expect(response).to be_success }
  end
end

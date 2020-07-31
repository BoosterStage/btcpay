# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::Health, :vcr do
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #status' do
    let(:response) { subject.status }

    it { expect(response).to be_success }
  end
end

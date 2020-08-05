# frozen_string_literal: true

RSpec.describe BtcPay do
  it 'has a version number' do
    expect(BtcPay::VERSION).to eq('0.1.1')
  end

  describe '.new' do
    it { expect(described_class.new(auth_token: '123', base_url: 'http://localhost')).to be_a(BtcPay::Client::Base) }
  end
end

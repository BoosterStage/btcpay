# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Config do
  let(:config) { build(:config) }

  describe '#initialize' do
    context '#base_url' do
      it do
        subject = described_class.new(**config.to_h)
        expect(subject.base_url).to eq(config.base_url)
      end

      it { expect { described_class.new(auth_token: 123) }.to raise_error(ArgumentError, 'invalid base_url') }
    end

    context '#authorization' do
      it do
        expect { described_class.new(base_url: config.base_url) }
          .to raise_error(ArgumentError, 'auth_token or basic_auth_token required')
      end

      context 'auth_token' do
        it do
          subject = described_class.new(**config.to_h)
          expect(subject.auth_token).to eq(config.auth_token)
          expect(subject.authorization).to eq("token #{config.auth_token}")
        end
      end

      context 'basic_auth_token' do
        let(:config) { build(:config, :basic_auth_token) }

        it do
          subject = described_class.new(**config.to_h)
          expect(subject.basic_auth_token).to eq(config.basic_auth_token)
          expect(subject.authorization).to eq("Basic #{config.basic_auth_token}")
        end
      end
    end
  end

  describe '#to_h' do
    subject { described_class.new(**config.to_h) }

    it 'returns hash' do
      expect(subject.to_h).to eq({
        auth_token: config.auth_token,
        basic_auth_token: config.basic_auth_token,
        base_url: config.base_url,
        user_agent: config.user_agent
      }.compact)
    end
  end
end

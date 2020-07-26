# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Result do
  let(:response) { double('response') }
  let(:code) { 200 }
  let(:body) do
    {
      data: {
        test: 'test'
      }
    }
  end
  let(:headers) do
    {
      content_type: 'application/json'
    }
  end

  before(:each) do
    allow(response).to receive(:body).and_return(body.to_json)
    allow(response).to receive(:code).and_return(code)
    allow(response).to receive(:headers).and_return(headers)
  end

  describe '.success' do
    it 'captures response and sets status to success' do
      result = described_class.success(response)

      expect(result).to be_a(BtcPay::Client::Result)
      expect(result.success?).to be_truthy
      expect(result.failure?).to be_falsey
      expect(result.body).to eq(body.with_indifferent_access)
      expect(result.code).to eq(code)
    end
  end

  describe '.failed' do
    it 'captures response and sets status to failed' do
      result = described_class.failed(response)

      expect(result).to be_a(BtcPay::Client::Result)
      expect(result.success?).to be_falsey
      expect(result.failure?).to be_truthy
      expect(result.body).to eq(body.with_indifferent_access)
      expect(result.code).to eq(code)
    end
  end

  describe '#success?' do
    let(:result) { described_class.success(response) }

    it 'returns true if success' do
      expect(result.success?).to be_truthy
      expect(result.failure?).to be_falsey
    end
  end

  describe '#failure?' do
    let(:result) { described_class.failed(response) }

    it 'returns true if failed' do
      expect(result.failure?).to be_truthy
      expect(result.success?).to be_falsey
    end
  end

  describe '#to_h' do
    it 'returns a hash of values' do
      result = described_class.success(response)
      expect(result.to_h).to eq(code: code, headers: headers, body: body.with_indifferent_access, status: :success)
    end
  end
end

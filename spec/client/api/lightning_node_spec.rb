# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::LightningNode, :vcr do
  let(:crypto_code) { 'TODO' }
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  before { pending('need to set up lightning network') }

  describe 'GET #info' do
    let(:response) { subject.info(crypto_code) }

    it { expect(response).to be_success }
  end

  describe 'POST #connect' do
    let(:payload) { 'TODO' }
    let(:response) { subject.connect(crypto_code, payload) }

    it { expect(response).to be_success }
  end

  describe 'GET #channels' do
    let(:response) { subject.channels(crypto_code) }

    it { expect(response).to be_success }
  end

  describe 'POST #open' do
    let(:payload) { 'TODO' }
    let(:response) { subject.open(crypto_code, payload) }

    it { expect(response).to be_success }
  end

  describe 'POST #deposit_address' do
    let(:payload) { 'TODO' }
    let(:response) { subject.deposit_address(crypto_code, payload) }

    it { expect(response).to be_success }
  end

  describe 'GET #invoice' do
    let(:invoice_id) { 'TODO' }
    let(:response) { subject.invoice(crypto_code, invoice_id) }

    it { expect(response).to be_success }
  end

  describe 'POST #pay' do
    let(:payload) { 'TODO' }
    let(:response) { subject.pay(crypto_code, payload) }

    it { expect(response).to be_success }
  end

  describe 'POST #create_invoice' do
    let(:payload) { 'TODO' }
    let(:response) { subject.create_invoice(crypto_code, payload) }

    it { expect(response).to be_success }
  end
end

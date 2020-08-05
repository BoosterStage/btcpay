# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BtcPay::Client::Api::Store, :vcr do
  let(:store_id) { '5wDCC8j1d7jEF8fVh2jJKjHw6eZdzeAZZLhogqf1njMS' }
  let(:client) { build(:client) }
  subject { described_class.new(client: client) }

  describe 'GET #all' do
    let(:response) { subject.all }

    it { expect(response).to be_success }
  end

  describe 'POST #create' do
    let(:payload) { build(:store_payload) }
    let(:response) { subject.create(payload) }

    it { expect(response).to be_success }
  end

  describe 'GET #get' do
    let(:response) { subject.get(store_id) }

    it { expect(response).to be_success }
  end

  describe 'PUT #update' do
    let(:payload) { build(:store_payload) }
    let(:response) { subject.update(store_id, payload) }

    it { expect(response).to be_success }
  end

  describe 'DELETE #delete' do
    let(:response) { subject.delete(store_id) }

    it { expect(response).to be_success }
  end
end

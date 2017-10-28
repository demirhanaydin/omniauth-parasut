# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::Parasut do
  let(:access_token) { instance_double('AccessToken', options: {}) }
  let(:parsed_response) { instance_double('ParsedResponse') }
  let(:response) { instance_double('Response', parsed: parsed_response) }

  subject(:strategy) do
    described_class.new({})
  end

  before(:each) do
    allow(strategy).to receive(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'should have correct site' do
      default_site = 'https://api.parasut.com'
      expect(strategy.options.client_options.site).to eq(default_site)
    end
  end

  context 'auth_hash' do
    it 'should assign raw_info' do
      expect(access_token).to receive(:get).with('/v4/me').and_return(response)
      expect(strategy.extra[:raw_info]).to eq(parsed_response)
    end

    it 'should assign uid & info' do
      info = {
        'data' => {
          'id' => '1',
          'type'       => 'users',
          'attributes' => {
            'email' => 'a@b.com',
            'name' => 'Test'
          }
        }
      }
      allow(strategy).to receive(:raw_info).and_return(info)
      expect(strategy.uid).to eq('1')
      expect(strategy.info[:email]).to eq('a@b.com')
      expect(strategy.info[:name]).to eq('Test')
    end
  end
end

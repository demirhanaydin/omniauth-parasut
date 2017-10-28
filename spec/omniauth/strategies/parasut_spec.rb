require 'spec_helper'

describe OmniAuth::Strategies::Parasut do
  let(:access_token) { instance_double('AccessToken', options: {}) }
  let(:parsed_response) { instance_double('ParsedResponse') }
  let(:response) { instance_double('Response', parsed: parsed_response) }

  subject do
    OmniAuth::Strategies::Parasut.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'should have correct site' do
      default_site = 'https://api.parasut.com'
      expect(subject.options.client_options.site).to eq(default_site)
    end
  end

  context 'auth_hash' do
    it 'should assign raw_info' do
      expect(access_token).to receive(:get).with('/v4/me').and_return(response)
      expect(subject.extra[:raw_info]).to eq(parsed_response)
    end

    it 'should assign uid & info' do
      allow(subject).to receive(:raw_info).and_return('data' => {
                                                        'id'         => '1',
                                                        'type'       => 'users',
                                                        'attributes' => {
                                                          'email' => 'a@b.com',
                                                          'name'  => 'Test'
                                                        }
                                                      })
      expect(subject.uid).to eq('1')
      expect(subject.info[:email]).to eq('a@b.com')
      expect(subject.info[:name]).to eq('Test')
    end
  end
end

# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Authentication strategy for connecting with PARASUT APIs using OAuth2.0
    # the [OAuth 2.0 Specification](http://tools.ietf.org/html/draft-ietf-oauth-v2-10).
    class Parasut < OmniAuth::Strategies::OAuth2
      CONTENT_TYPE = 'application/vnd.api+json'.freeze
      option :client_options, site: 'https://api.parasut.com'

      uid { raw_info['data']['id'] }

      info do
        {
          name:  user_attributes['name'],
          email: user_attributes['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def setup_phase
        ::OAuth2::Response.register_parser(:json, CONTENT_TYPE) do |body|
          MultiJson.load(body)
        end
      end

      def raw_info
        @raw_info ||= access_token.get('/v4/me').parsed
      end

      private

      def user_attributes
        raw_info['data']['attributes']
      end
    end
  end
end

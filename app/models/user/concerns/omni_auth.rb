class User
  module Concerns
    module OmniAuth
      extend ActiveSupport::Concern

      included do
        field :provider,           type: String
        field :uid,                type: String
        field :oauth_token,        type: String
        field :oauth_expires_at,   type: DateTime
      end

      module ClassMethods
        def from_omniauth(auth)
          where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            user.save!
          end
        end
      end
    end
  end
end

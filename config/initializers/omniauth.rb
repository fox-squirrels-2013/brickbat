Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end

OmniAuth.config.test_mode = true

info_hash = OmniAuth::AuthHash::InfoHash.new

info_hash.nickname = "testuser"

auth_credentials = OmniAuth::AuthHash::InfoHash.new

auth_credentials.token = "123123123123"
auth_credentials.secret = "321123321123"

auth_hash = OmniAuth::AuthHash.new
auth_hash.provider = 'twitter'
auth_hash.uid = 123456
auth_hash.credentials = auth_credentials
auth_hash.info = info_hash

OmniAuth.config.mock_auth[:twitter] = auth_hash
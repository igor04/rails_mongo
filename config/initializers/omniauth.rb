Rails.application.config.middleware.use OmniAuth::Builder do
	require 'openid/store/filesystem'
  provider :twitter, 'hlTjUFNSkXI0daNISkWBTQ', 'BwTcwrUyxhkqLFCASR9C6OBdtmOpql3TnqfxlCsyY'
  provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp'), :identifier => 'https://www.google.com/accounts/o8/id'
end
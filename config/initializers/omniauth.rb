Rails.application.config.middleware.use OmniAuth::Builder do
	require 'openid/store/filesystem'
  provider :twitter, 'vseSy46UauC7AzQykh7NzQ', 'PYx8fk4kT6fXaXr0SqgiatJeMR5X3MrHTtkUc2p8'
  provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp'), :identifier => 'https://www.google.com/accounts/o8/id'
end
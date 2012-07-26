require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'vseSy46UauC7AzQykh7NzQ', 'PYx8fk4kT6fXaXr0SqgiatJeMR5X3MrHTtkUc2p8'
  provider :open_id, store: OpenID::Store::Filesystem.new('/tmp')
end
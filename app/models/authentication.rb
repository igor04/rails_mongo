class Authentication
	include Mongoid::Document

	field :provider,  type: String
  field :uid,       type: String
  field :user_id,		type: Integer

  belongs_to :user
  
  def self.provider_exists?(provider)
    where(provider: provider.to_s).exists?
  end

  def provider_name
    if provider == 'open_id'
      "OpenID"
    else
      provider.titleize
    end
  end
end
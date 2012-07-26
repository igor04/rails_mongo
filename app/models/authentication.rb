class Authentication
	include Mongoid::Document

	field :provider,  type: String
  field :uid,       type: String
  field :user_id,		type: Integer

  belongs_to :user

  def provider_name
    if provider == 'open_id'
      "OpenID"
    else
      provider.titleize
    end
  end
end
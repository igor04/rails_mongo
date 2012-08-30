class UserInformation
  include Mongoid::Document
 	include Mongoid::MultiParameterAttributes
  
  field :user_id, 	:type => Integer
  field :firstname,	:type => String
  field :lastname,	:type => String
  field :birthday,	:type => Date

  belongs_to :user
end
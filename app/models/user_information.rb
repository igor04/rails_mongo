class UserInformation
  include Mongoid::Document

  field :firstname,	:type => String, :default => ""
  field :lastname,	:type => String, :default => ""
  field :birthday,	:type => Time, :default => ""

end
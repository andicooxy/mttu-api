class User < ApplicationRecord
  include UserSerializer

  # belongs_to :user_type, optional: true 
  belongs_to :department
  belongs_to :region  
  has_many   :offenses 
  has_secure_password
end





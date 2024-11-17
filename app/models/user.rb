# email:string
# password_digest:String
#
#password:String virtual
#password_confirmation:string virtual
class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
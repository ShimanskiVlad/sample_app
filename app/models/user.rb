class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :email,
            presence: true,
            email_format: { message: '???' },
            uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }
  has_secure_password
  validates :password, length: { minimum: 6 }
end

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :password_confirmation, presence: true
  validates_format_of :email, :with => /.+@.+\..+/i
  validates :email, uniqueness: true
end

# User Model
class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates_format_of :email, with: /@/
  has_secure_password
end

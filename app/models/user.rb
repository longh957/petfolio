# User Model
class User < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates_format_of :email, with: /@/
  # Relationships
  has_one :api_key, dependent: :destroy
  # Secure Password
  has_secure_password
  # Call Backs
  before_create :create_api_key

  private

  def create_api_key
    self.api_key = ApiKey.create
  end
end

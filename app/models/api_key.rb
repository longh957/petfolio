# Api key Model
class ApiKey < ApplicationRecord
  # Relationships
  belongs_to :user
  # Callbacks
  before_create :generate_access_token

  def as_json
    super(only: :access_token)
  end

  private

  def generate_access_token
    self.access_token = SecureRandom.hex
    while self.class.exists? access_token: access_token
      self.access_token = SecureRandom.hex
    end
  end
end

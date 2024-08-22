class User < ApplicationRecord
  has_many :entries

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    email = data["email"]

    User.find_or_create_by(email:)
  end
end

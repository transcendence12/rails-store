class Subscriber < ApplicationRecord
  include Tokenizable

  belongs_to :product

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

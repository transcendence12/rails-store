module Tokenizable
  extend ActiveSupport::Concern

  def generate_token_for(purpose)
    Rails.application.message_verifier(purpose).generate(id, expires_in: 7.days)
  end

  module ClassMethods
    def find_by_token_for(purpose, token)
      id = Rails.application.message_verifier(purpose).verify(token, purpose: purpose)
      find_by(id: id)
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
    end
  end
end

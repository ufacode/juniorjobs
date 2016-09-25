# frozen_string_literal: true
class RegistrationMailer < ApplicationMailer
  def password
    generated_password = Devise.friendly_token.first(8)
    @user = User.create!(email: email, password: generated_password)
end
end

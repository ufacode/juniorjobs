# frozen_string_literal: true
class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password
  has_many :profiles
  validates :email, presence: true
  validates :name, presence: true

  private

  def confirmation_token
    if confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
  end

# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :profiles

  def name
    user.name = profile.name
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
end

# == Schema Information
#
# Table name: users
#
#  confirm_token   :string(255)
#  created_at      :datetime         not null
#  email           :string(255)
#  email_confirmed :boolean
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  updated_at      :datetime         not null
#

# frozen_string_literal: true
class Profile < ApplicationRecord
  include AASM

  belongs_to :user

  validates :name, :fio, :cv, :photo, :description, :expectations, presence: true
  validates :money_from, numericality: true
  validates :money_to, numericality: { greater_than: :money_from }

  mount_uploader :photo, PhotoUploader
  mount_uploader :cv, CvUploader

  aasm do
    state :unconfirmed, initial: true
    state :confirmed

    event :confirm do
      transitions from: :unconfirmed, to: :confirmed
    end
  end

  # scope :confirmed, ->{ where(aasm_state: Profile.states[:confirmed]) }
end

# == Schema Information
#
# Table name: profiles
#
#  aasm_state   :string(255)
#  category     :string(255)
#  created_at   :datetime         not null
#  cv           :string(255)
#  description  :string(255)
#  expectations :string(255)
#  fio          :string(255)
#  hide         :boolean          default(FALSE)
#  id           :integer          not null, primary key
#  linkedin     :string(255)
#  location     :string(255)
#  money_from   :decimal(10, )
#  money_to     :decimal(10, )
#  name         :string(255)
#  photo        :string(255)
#  site         :string(255)
#  skype        :string(255)
#  updated_at   :datetime         not null
#  user_id      :integer
#

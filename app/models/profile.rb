# frozen_string_literal: true
class Profile < ApplicationRecord
  include AASM

  aasm do
    state :unconfirmed, initial: true
    state :confirmed

    event :confirm do
      transitions from: :unconfirmed, to: :confirmed
    end
  end

  belongs_to :user
  accepts_nested_attributes_for :user
  validates :user, presence: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :cv, CvUploader

  validates :name, presence: true
  validates :fio, presence: true
  validates :skype, presence: true
  validates :site, presence: true
  validates :category, presence: true
  validates :cv, presence: true
  validates :photo, presence: true
  validates :location, presence: true
  validates :linkedin, presence: true
  validates :description, presence: true
  validates :expectations, presence: true
  validates :money_from, numericality: true
  validates :money_to, numericality: true
  validate :money_from_cannot_be_greater_than_money_to

  private

  def money_from_cannot_be_greater_than_money_to
    errors.add(:money_from, 'cannot be greater than money to') if
    money_from > money_to
  end
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

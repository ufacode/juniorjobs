# frozen_string_literal: true
class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  mount_uploader :cv, CvUploader
  validates :name, presence: true
  validates :fio, presence: true
  validates :skype, presence: true
  validates :site, presence: true
  validates :category, presence: true
  validates_presence_of :cv
  validates_presence_of :photo
  validates :location, presence: true
  validates :linkedin, presence: true
  validates :descriprion, presence: true
  validates :expectations, presence: true
  validates :money_from, numericality: true
  validates :money_to, numericality: true
  validate :money_from_cannot_be_greater_than_money_to

  def money_from_cannot_be_greater_than_money_to
    errors.add(:money_from, 'cannot be greater than money to') if
    money_from > money_to
    end
end
#   @TODO: add validations (!!!)

# == Schema Information
#
# Table name: profiles
#
#  category     :string(255)
#  created_at   :datetime         not null
#  cv           :string(255)
#  descriprion  :string(255)
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

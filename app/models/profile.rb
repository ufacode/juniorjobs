# frozen_string_literal: true
class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  mount_uploader :cv, CvUploader

#   @TODO: add validations (!!!)

end

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
#

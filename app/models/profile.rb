class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploader :cv, CvUploader
end

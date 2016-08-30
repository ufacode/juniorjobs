class Profile < ApplicationRecord
	attr_accessible :photo
	belongs_to :user
	mount_uploader :photo, PhotoUploader
	has_attached_file :photo
	mount_uploader :cv, CvUploader
	has_attached_file :cv
	validates :name, presence:
end

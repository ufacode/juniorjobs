# frozen_string_literal: true
class Vacancy < ApplicationRecord
	validates :name, presence: true
	validates :kind, presence: true
	validates :description, presence: true
	validates :contact_to, presence: true
	validates :expire, presence: true

	def expire_dates
		expire_dates = [7, 14, 30]
		expire_at = DateTime.now + expire_dates[params[:expire]].days
	end

end

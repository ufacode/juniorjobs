# frozen_string_literal: true
class Vacancy < ApplicationRecord
	before_save :expire_date, on: :create
	validates :name, :kind, :location, :remote, :company, :site, :phone,
	:contact_to, :expire, presence: true
	validates :expire, numericality: {only_integer: true}

	def expire_date
		expire_dates = [7.14,30]
		expite_at = DateTime.now + expire_dates[expire].days
	end
end

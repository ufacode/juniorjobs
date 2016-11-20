# frozen_string_literal: true
class Users::ConfirmationsController < Devise::ConfirmationsController
  after_action :set_profiles, only: [:show]

  private

  def set_profiles
    return unless resource.errors.empty?
    resource.profiles.find_each do |profile|
      profile.confirm!
    end
  end
end
